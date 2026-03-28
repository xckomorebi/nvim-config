vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.code-snippets",
    command = "setfiletype jsonc"
})
