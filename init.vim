set noerrorbells
set belloff=all
set tabstop=4 softtabstop=4
set shiftwidth=4
set mouse=a

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

set expandtab
set smartindent
set number
set smartcase
set hlsearch

set path+=**
set wildchar=<tab>
set ignorecase
set wildignore=*.pyc
au FileType * set fo-=c fo-=r fo-=o

call plug#begin('~/.vim/plugged')

" themes
Plug 'morhetz/gruvbox'
Plug 'glepnir/oceanic-material'
Plug 'sainnhe/sonokai'

" look
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

" utils
Plug 'tpope/vim-commentary'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'github/copilot.vim'

" coc
Plug 'neoclide/coc.nvim'
Plug 'sheerun/vim-polyglot'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'fannheyward/telescope-coc.nvim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sharkdp/fd'
Plug 'nvim-tree/nvim-web-devicons'

" debugger
Plug 'vim-test/vim-test'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'
Plug 'nvim-neotest/nvim-nio'

" folke
Plug 'folke/noice.nvim'
Plug 'rcarriga/nvim-notify'

call plug#end()

" colorscheme
let g:sonokai_disable_italic_comment=1
let g:sonokai_transparent_background=1
colorscheme sonokai
highlight LineNr ctermfg=151

lua require('xcritty')

" lightline
let g:lightline = {
            \ 'colorscheme': 'materia',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ }

set laststatus=2
set noshowmode

" commentary
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

" coc
source ~/.vim/coc.vim
autocmd BufWritePre *.go :silent call CocAction('format')
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" autocmd BufEnter *.go set syntax=off

" keymapping
let mapleader=" "

silent! nmap <A-F> <cmd>call CocAction('format')<CR>
silent! nmap <A-O> <cmd>call CocAction('runCommand', 'editor.action.organizeImport')<CR>

nnoremap <leader>b <cmd>Neotree<CR>
nnoremap <leader>r <cmd>Neotree reveal_file=%<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>

if isdirectory('.git')
  nnoremap <leader>fp <cmd>Telescope git_files<cr>
else
  nnoremap <leader>fp <cmd>Telescope find_files<cr>
endif

nnoremap <leader>fg <cmd>Telescope live_grep_args<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>pp <cmd>Telescope commands<cr>

nnoremap <leader>9 <cmd>DapToggleBreakpoint<cr>

nnoremap <f5> <cmd>DapContinue<cr>
nnoremap <leader>ds <cmd>DapStepOver<cr>
nnoremap <leader>di <cmd>DapStepInto<cr>
nnoremap <leader>do <cmd>DapStepOut<cr>
nnoremap <leader>dq <cmd>DapTerminate<cr>


nmap <silent> gi <cmd>Telescope coc implementations<CR>
nmap <silent> gr <cmd>Telescope coc references<CR>
nmap <leader>fo <cmd>Telescope coc document_symbols<cr>

