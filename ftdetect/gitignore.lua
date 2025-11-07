vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "skipped_tests.txt",
    callback = function()
        vim.bo.filetype = "gitignore"
    end
})
