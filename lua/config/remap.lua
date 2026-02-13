local keyset = vim.keymap.set

keyset("t", "<C-q>", "<C-\\><C-N>", { desc = "Go to Normal mode" })

-- Use Ctrl + w + h/j/k/l to navigate between windows in Terminal mode
keyset("t", "<C-w>h", "<C-\\><C-N><C-w>h", { desc = "Go to left window" })
keyset("t", "<C-w>j", "<C-\\><C-N><C-w>j", { desc = "Go to lower window" })
keyset("t", "<C-w>k", "<C-\\><C-N><C-w>k", { desc = "Go to upper window" })
keyset("t", "<C-w>l", "<C-\\><C-N><C-w>l", { desc = "Go to right window" })

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
