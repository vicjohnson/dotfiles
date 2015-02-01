execute pathogen#infect()

filetype plugin on

filetype indent on
set autoindent
set smartindent

set number
syntax on
colorscheme jellybeans

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set cursorline

set showmatch

let mapleader=","
map j gj
map k gk
map <leader>d :bd<cr> 
map <leader>e :e<space>
nnoremap <leader><S-tab> :bp<cr>
nnoremap <leader><tab> :bn<cr>
nnoremap <leader>b :buffer<space>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>h :sp<cr>
nnoremap <leader>l :ls<cr>
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>s :w<cr> 

nnoremap <leader>p :CtrlP c<cr>

autocmd BufNewFile,BufRead *.json set ft=json

set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase
