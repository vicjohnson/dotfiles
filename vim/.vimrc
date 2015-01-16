execute pathogen#infect()

set number
syntax on
colorscheme jellybeans

set tabstop=4
set softtabstop=4
set expandtab

set cursorline

set showmatch

set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase


let mapleader=","
map j gj
map k gk
map <leader>bd :bd<cr> 
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
nnoremap <leader><S-tab> :tabprevious<cr>
nnoremap <leader><tab> :tabnext<cr>

autocmd BufNewFile,BufRead *.json set ft=json
