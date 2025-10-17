require("lsp.gopls")
require("lsp.luals")
require("lsp.copilot")
require("lsp.clangd")
require("lsp.pyright")

vim.lsp.enable({
    "gopls",
    "pyright",
    "luals",
    "copilot",
    "clangd",
})
