local keyset = vim.keymap.set

keyset("t", "<C-q>", "<C-\\><C-N>", { desc = "Go to Normal mode" })

keyset("n", "<leader>tu", "<cmd>ToggleSonoakiTransparency<cr>")

keyset("n", "<C-->", "<C-o>", { desc = "Go to previous location" })
keyset("n", "<C-_>", "<C-o>", { desc = "Go to previous location" })

keyset("n", "<A-F>", vim.lsp.buf.format, { desc = "Format code", silent = true })

keyset("n", "<A-O>",
    function()
        ---@diagnostic disable-next-line
        vim.lsp.buf.code_action { context = { only = { "source.organizeImports" } }, apply = true }
    end,
    { desc = "Organize imports", silent = true }
)
