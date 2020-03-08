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

set undodir=~/.vimdid
set undofile

" Colors
set background=dark

let g:ctrlp_cmd = 'CtrlPMixed'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:python3_host_prog='/usr/bin/python3'

" language client config
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
	\ 'php': ['php', '/usr/bin/php-language-server'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

set completeopt=noinsert,menuone,noselect
autocmd BufEnter  *  call ncm2#enable_for_buffer()

inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

nnoremap <c-SPACE> :call LanguageClient_contextMenu()<CR>
" Required for operations modifying multiple buffers like rename.
set hidden

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <S-F6> :call LanguageClient#textDocument_rename()<CR>

call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sensible'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-surround'

Plug 'airblade/vim-rooter'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

Plug 'junegunn/fzf'

call plug#end()
