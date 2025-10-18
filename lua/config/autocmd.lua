vim.api.nvim_create_augroup("General", {})

---@diagnostic disable-next-line
vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function()
        vim.opt_local.number = true
    end,
    group = "General",
    desc = "Enable Line Number in Telescope Preview",
})

---@diagnostic disable-next-line
vim.api.nvim_create_autocmd("TermEnter", {
    pattern = { "term://*toggleterm#*" },
    group = "General",

    callback = function()
        vim.keymap.set({ "n", "t" },
            "<Esc><Esc>", "<cmd>ToggleTerm<cr>",
            { buffer = 0 })
    end,
})

vim.api.nvim_create_autocmd("CursorHold", {
    group = "General",
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end
})

local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    group = lsp_format_augroup,
    callback = function()
        local params = vim.lsp.util.make_range_params(0, "utf-8")
        ---@diagnostic disable-next-line
        params.context = {only = {"source.organizeImports"}}
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
        vim.lsp.buf.format({async = false})
    end,
})
