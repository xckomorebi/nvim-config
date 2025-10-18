vim.api.nvim_create_augroup("General", {})
vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function()
        vim.opt_local.number = true
    end,
    group = "General",
    desc = "Enable Line Number in Telescope Preview",
})

-- TODO move it to lsp's on attach
local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    group = lsp_format_augroup,
    callback = function()
        vim.lsp.buf.format()

        vim.lsp.buf.code_action({
            context = {
                only = {
                    "source.organizeImports"
                },
                diagnostics = {}
            },
            apply = true,
        })
    end,
})

vim.api.nvim_create_autocmd("TermEnter", {
    pattern = { "term://*toggleterm#*" },
    group = "General",

    callback = function()
        vim.keymap.set({ "n", "t" },
            "<Esc><Esc>", "<cmd>ToggleTerm<cr>",
            { buffer = 0 })
    end,
})
