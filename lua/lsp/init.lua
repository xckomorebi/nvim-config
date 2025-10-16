vim.lsp.config["gopls"] = {
    cmd = { "gopls" },
    filetypes = { "go" },
    root_markers = { { "go.mod", "go.sum" }, ".git" },
    settings = {
    }
}

vim.lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            }
        }
    }
}

vim.lsp.config('copilot', {
    cmd = { 'copilot-language-server', '--stdio', },
    root_markers = { '.git' },
})

vim.lsp.enable({"gopls", "luals", "copilot"})
-- vim.lsp.inline_completion.enable()
