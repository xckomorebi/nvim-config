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

