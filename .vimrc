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

set nowrap

filetype plugin indent on

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

syntax sync fromstart

let g:rust_recommended_style = 0
let g:rustfmt_autosave_if_config_present = 1
let g_rustfmt_command = "rustfmt +stable"

" Allow saving through <leader>w
nnoremap <Leader>w w

" Clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

let g:netrw_banner = 0
let g:netwr_brows_split = 2

nnoremap Q <Nop>

" splitting controls
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Add shortcut move keys
nnoremap <S-J> 10j
nnoremap <S-K> 10k

set splitbelow
set splitright

set undodir=~/.vimdid
set undofile

" Colors
set background=dark
set termguicolors

" See https://ramgo.li/posts/coc.nvim_split_if_not_open/
" use in coc config for jumpCommand
function! SplitIfNotOpen(fname)
	let bufnum=bufnr(expand(a:fname))
	let winnum=bufwinnr(bufnum)
	if winnum != -1
	" Jump to existing split
	exe winnum . "wincmd w"
	else
	" Make new split as usual
	exe "vsplit " . a:fname
	endif
	" Execute the cursor movement command
	" exe a:call
endfunction

command! -nargs=+ -complete=file CocSplitIfNotOpen :call SplitIfNotOpen(<f-args>)


if has('ideavim')
	set commentary
endif

if !has('ideavim')
	nmap <C-p> <Plug>CtrlSFPrompt
	let g:ctrlsf_auto_focus = {
				\  "at": "start"
				\}
	let g:ctrlsf_auto_preview = 1
	let g:ctrlsf_default_view_mode = 'compact'
	let g:ctrlsf_backend = 'ag'
	let g:ctrlsf_winsize = '20%'
	let g:ctrlsf_auto_close = {
        \ "normal" : 1,
        \ "compact": 1
        \ }

	map / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)
	let g:EasyMotion_smartcase = 1

	" Required for operations modifying multiple buffers like rename.

	augroup filetype_rust
		autocmd!
		autocmd BufReadPost *.rs setlocal filetype=rust
	augroup END

	" CoC config

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()
	" disable ctrl-space in normal mode
	nmap <c-space> <Plug>(coc-codeaction)
	vmap <c-space> <Plug>(coc-codeaction-selected)

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	if has('patch8.1.1068')
	  " Use `complete_info` if your (Neo)Vim version supports it.
	  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
	  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif

	" press tab to jump to the end of the line after completion
	" inoremap <Tab> <esc>%%a

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Goto navigation using left mouse click like in Intellij
	nmap <C-LeftMouse> <LeftMouse> <Plug>(coc-definition)

	" Use K to show documentation in preview window.
	nnoremap <silent> H :call <SID>show_documentation()<CR>

	" Use Intellij keybind for rename action
	nmap <silent> <S-F6> <Plug>(coc-rename)

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  else
		call CocAction('doHover')
	  endif
	endfunction

	" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)

	" format file
	nmap <leader>f <Plug>(coc-format)
	vmap <leader>f <Plug>(coc-format-selected)

	call plug#begin('~/.local/share/nvim/plugged')

	Plug 'itchyny/lightline.vim'
	Plug 'mike-hearn/base16-vim-lightline'

	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-git'

	Plug 'easymotion/vim-easymotion'

	Plug 'christoomey/vim-tmux-navigator'


	Plug 'airblade/vim-rooter'

	Plug 'editorconfig/editorconfig-vim'
	Plug 'dyng/ctrlsf.vim'

	Plug 'rust-lang/rust.vim'
	Plug 'ElmCast/elm-vim'
    Plug 'neovimhaskell/haskell-vim'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

endif " not has ideavim
