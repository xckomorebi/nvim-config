vim.o.number = true
vim.o.smartcase = true
vim.o.ignorecase = true

vim.o.expandtab = true
vim.o.tabstop = 4

vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.list = true

vim.opt.listchars = {
    tab = '▸ ',
    trail = "·",
    leadmultispace = "▏   "
}

vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300

vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.formatoptions = vim.opt.formatoptions - "o" - "r"
