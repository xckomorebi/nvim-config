require("lsp.gopls")
require("lsp.luals")
require("lsp.clangd")
require("lsp.pyright")
require("lsp.jsonls")
require("lsp.tsserver")
require("lsp.rust")

vim.lsp.enable({
    "gopls",
    "pyright",
    "luals",
    "clangd",
    "jsonls",
    "ts_ls",
    "rust_analyzer",
})

vim.diagnostic.config({
    float = {
        source = 'if_many'
    }
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end
})
