execute pathogen#infect()

filetype plugin on

" Setup auto indenting and default tabs to translate to 4 spaces.
filetype indent on
set autoindent
set smartindent

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab


" Line numbers, syntax highlighting, and preferred color scheme
set number
syntax on
colorscheme jellybeans

" Highlight the line the cursor is on
set cursorline

" Show matching brackets
set showmatch

" I never use the backup files anyways....
set nobackup
set nowb
set noswapfile

" Change the leader key and set custom bindings
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

" Set search settings and map a key to remove highlighting
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase
