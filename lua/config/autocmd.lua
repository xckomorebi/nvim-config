vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    callback = function()
        vim.fn.CocAction("format")
        vim.fn.CocAction("organizeImport")
    end,
    desc = "Organize imports and format document",
})

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
