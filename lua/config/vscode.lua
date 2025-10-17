vim.o.cmdheight = 0

local function keymap(mode, lhs, vscode_cmd)
    vim.keymap.set(mode, lhs, function()
        vim.fn.VSCodeNotify(vscode_cmd)
    end, { noremap = true, silent = true })
end

vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

keymap("n", "<leader>fp", "workbench.action.quickOpen")
