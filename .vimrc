" Reference {{{
" https://dougblack.io/words/a-good-vimrc.html
" }}}

" UI Config {{{
" color theme
colorscheme molokai
"" show line number
set number
"" show command in bottom  bar
set showcmd
"" highlight current line
set cursorline
""  visual autocomplete for command menu
set wildmenu
"" highlight matching [{()}]
set showmatch
set matchtime=1
" }}}

" Spaces & Tabs {{{
"" number of visual spaces per TAB
set tabstop=4
"" number of spaces in tab when editing
set softtabstop=4
"" tabs are spaces
set expandtab
set shiftwidth=4
"" TAB will looks like >---
set list
set listchars=tab:>-
" }}} 

" Folding {{{
" enable folding
set foldenable
" open most folds by default
set foldlevelstart=10
" 10 nested fold max
set foldnestmax=10
" space open/close folds
" nnoremap <space> za
" }}} 

" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to begining/end of line
nnoremap B ^
nnoremap E $
" move among windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" }}} 

" Leader Shortcuts {{{
" map the leader key to <Space>
let mapleader=" "
let g:mapleader=" "
" save file
nnoremap <leader>w :w!<CR>
" quit vim/nvim
nnoremap <leader>q :wq!<CR>
"}}}

" MISC {{{
" set file encode
set encoding=utf-8 fileencoding=uft-8


" tell vim to fold sections by markers
" rather than indentation
" foldmethod=marker
" close every fold by default 
" so that we have this high level view 
" when we open our vimrc
" foldlevel=0
" use a modeline to make Vim 
" only use these settings for this file.
set modelines=1
" vim:foldmethod=marker:foldlevel=0
