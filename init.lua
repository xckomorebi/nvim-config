if vim.g.vscode then
    require("config.vscode")
else
    require("config.lazy")
    require("config.opts")
    require("config.remap")
    require("config.autocmd")
    require("config.commands")

    require("lsp")
end
