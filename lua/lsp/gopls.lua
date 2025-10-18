vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
    root_markers = { "go.mod", "go.sum", ".git" },
    settings = {
        gopls = {
            staticcheck = true,
            analyses = {
                modernize = false,
            }
        }
    }
})
