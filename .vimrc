"dsf Fish doesn't play nice with things
set shell=/bin/bash
let mapleader=","

set nu rnu

syntax on

set shiftwidth=4
set tabstop=4

set cmdheight=1
set showcmd

let g:netrw_banner = 0
let g:netwr_brows_split = 2

nnoremap Q <Nop>

" splitting controls
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Colors
set background=dark

" quit everything
map <leader>q :confirm qall<CR>

let g:ctrlp_cmd = 'CtrlPMixed'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'Quramy/tsuquyomi'
Plug 'tpope/vim-sensible'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
" Plug 'valloric/youcompleteme'

Plug 'airblade/vim-rooter'

Plug 'ctrlpvim/ctrlp.vim'

call plug#end()
