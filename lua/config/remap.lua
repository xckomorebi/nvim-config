function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

local keyset = vim.keymap.set

-- Coc Actions
keyset("n", "<C-->", "<C-o>", { desc = "Go to previous location" })
keyset("n", "<C-_>", "<C-o>", { desc = "Go to previous location" })

keyset("n", "<A-F>", "<cmd>call CocAction('format')<CR>",
    { desc = "Format code", silent = true })
keyset("n", "<A-O>", "<cmd>call CocAction('organizeImport')<CR>",
    { desc = "Organize imports", silent = true })

-- Coc Pum
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#confirm() : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

keyset("n", "<F2>", "<Plug>(coc-rename)", { silent = true })

keyset("n", "<leader>tu", "<cmd>ToggleSonoakiTransparency<cr>")

keyset("t", "<Esc><Esc>", "<C-\\><C-N>")

-- Unset keys
vim.keymap.del("n", "grt")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")
