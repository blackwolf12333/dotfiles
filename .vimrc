"dsf Fish doesn't play nice with things
set shell=/bin/bash
let mapleader=","

set nu rnu

syntax on

set shiftwidth=4
set tabstop=4

set cmdheight=1
set showcmd
set noshowmode

" Having longer updatetime (default is 4000ms) leads to noticeable
" delays and poor user experience according to the coc example config
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" TextEdit might fail if hidden is not set
set hidden

" Reduce Command timeout for faster escape
set timeoutlen=1000 ttimeoutlen=0

" Highlight matching bracket
set showmatch

" Enable mouse usage
set mouse=a
set mousemodel=popup

" visual indicator for column width
set colorcolumn=80

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
set termguicolors

" CtrlP setup
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:python3_host_prog='/usr/bin/python3'

" language client config
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
	\ 'php': ['php', '/usr/bin/php-language-server'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

let g:LanguageClient_useFloatingHover=1

" Required for operations modifying multiple buffers like rename.

augroup filetype_rust
    autocmd!
    autocmd BufReadPost *.rs setlocal filetype=rust
augroup END

" " I removed the noselect option here because I want it to automatically
" " select the first available option
" set completeopt=noinsert,menuone

" " I removed the <cr> after <c-y> because that would insert an additional
" " newline when not using the noselect option in completeopt
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
" " Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" inoremap <silent><c-SPACE> :call LanguageClient#contextMenu()<cr>

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <S-F6> :call LanguageClient#textDocument_rename()<CR>

" CoC config

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" disable ctrl-space in normal mode
nnoremap <c-space>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" press tab to jump to the end of the line after completion
inoremap <Tab> <esc>%%a

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Goto navigation using left mouse click like in Intellij
nmap <C-LeftMouse> <LeftMouse> <Plug>(coc-definition)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use Intellij keybind for rename action
nnoremap <silent> <S-F6> <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'mike-hearn/base16-vim-lightline'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-vinegar'

Plug 'christoomey/vim-tmux-navigator'


Plug 'airblade/vim-rooter'

Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

Plug 'junegunn/fzf'

Plug 'chriskempson/base16-vim'

call plug#end()

let g:lightline = {
	\ 'colorscheme': 'base16_atelier_dune',
	\ }

colorscheme base16-default-dark

function! s:base16_customize() abort
  call Base16hi("Comment", g:base16_gui08, g:base16_gui00, g:base16_cterm05, g:base16_cterm03, "bold", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

colorscheme base16-default-dark

