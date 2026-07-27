vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "ty.toml",
        ".git",
    },
})

--- @return string?
local function pyenv_global_python()
    local root = vim.trim(vim.fn.system("pyenv root"))
    if vim.v.shell_error ~= 0 or root == "" then
        return nil
    end

    local global = vim.trim(vim.fn.system("pyenv global"))
    if vim.v.shell_error ~= 0 or global == "" then
        return nil
    end

    -- `pyenv global` can list multiple fallback versions, one per line
    local version = vim.split(global, "\n")[1]
    return root .. "/versions/" .. version
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or client.name ~= "ty" then
            return
        end

        if vim.fn.isdirectory(vim.fn.getcwd() .. "/.venv") == 1 then
            return
        end

        local python = pyenv_global_python()
        if not python then
            return
        end

        client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
            ty = {
                configuration = {
                    environment = {
                        python = python,
                    },
                },
            },
        })
        client:notify("workspace/didChangeConfiguration", { settings = client.settings })
    end,
})
