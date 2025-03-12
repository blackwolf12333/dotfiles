"dsf Fish doesn't play nice with things
set shell=/bin/bash
let maplocalleader=","

set nu rnu 
syntax on

set cmdheight=1
set showcmd
set noshowmode

set nowrap
set whichwrap=<,>,l,h

" Other indentation stuff is detected by vim-sleuth plugin
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

" Clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

let g:netrw_banner = 0
let g:netwr_brows_split = 2

nnoremap Q <Nop>

" split window movement controls
" in combination with vim-tmux-navigator this allows moving
" between vim windows and tmux screens
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier tab navigation. This is useful when I already have 3 splits
" and want to open another (with for instance coc-definition) file in a new
" tab. This allows me to easily move between the tabs
nnoremap <silent> <A-l> :tabnext<CR>
nnoremap <silent> <A-h> :tabprevious<CR>

" simple mapping to do split resizing
nnoremap <silent> <A-a> :vertical resize +5<CR>
nnoremap <silent> <A-d> :vertical resize -5<CR>
nnoremap <silent> <A-s> :resize -5<CR>
nnoremap <silent> <A-w> :resize +5<CR>
nnoremap <silent> <A-=> <C-w>=

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

if has('ide')
	set commentary
endif

if !has('ide')
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
	imap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<cr>"

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

	nmap <leader>a <Plug>(coc-codelens-action)

	call plug#begin('~/.local/share/nvim/plugged')

	Plug 'itchyny/lightline.vim'
	Plug 'mike-hearn/base16-vim-lightline'

	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-git'
	Plug 'tpope/vim-sleuth'

	Plug 'easymotion/vim-easymotion'

	Plug 'christoomey/vim-tmux-navigator'


	Plug 'airblade/vim-rooter'

	Plug 'editorconfig/editorconfig-vim'
	Plug 'blackwolf12333/ctrlsf.vim'

	Plug 'rust-lang/rust.vim'
	Plug 'ElmCast/elm-vim'
	Plug 'neovimhaskell/haskell-vim'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'junegunn/fzf'

	Plug 'chriskempson/base16-vim'

	Plug 'wellle/context.vim'

	Plug 'nvim-lua/plenary.nvim'

	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

	Plug 'Olical/conjure'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
