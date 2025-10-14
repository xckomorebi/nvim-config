vim.o.cmdheight = 0

local function keymap(mode, lhs, vscode_cmd)
    vim.keymap.set(mode, lhs, function()
        vim.fn.VSCodeNotify(vscode_cmd)
    end, { noremap = true, silent = true })
end

vim.g.mapleader = " "

keymap("n", "gr", "editor.action.goToReferences")
keymap("n", "gi", "editor.action.goToImplementation")
keymap("n", "<leader>fp", "workbench.action.quickOpen")

vim.keymap.del("n", "grt")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")
