"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         __               __  __    __        _              "
"        / /______  ____  / /_/ /_  / /_  ___ ( )_____        "
"       / //_/ __ \/ __ \/ __/ __ \/ __ \/ _ \|// ___/        "
"      / ,< / / / / /_/ / /_/ / / / / / /  __/ (__  )         "
"     /_/|_/_/ /_/\____/\__/_/ /_/_/ /_/\___/ /____/          "
"         _       _ __        _                               "
"        (_)___  (_) /__   __(_)___ ___                       "
"       / / __ \/ / __/ | / / / __ `__ \                      "
"      / / / / / / /__| |/ / / / / / / /                      "
"     /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/  guanglaihe@gmail.com "
"                                     Last update: 2018-11-07 "
"                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reference {{{
" https://dougblack.io/words/a-good-vimrc.html
" }}}

" Leader Shortcuts {{{
" map the leader key to <Space>
let mapleader=" "
" let maplocalleader="\\"
" save file
nnoremap <leader>w :w!<CR>
" quit vim/nvim
nnoremap <leader>q :wq!<CR>
"}}}

" UI Config {{{
" show line number
set number
" show command in bottom  bar
set showcmd
" highlight current line
set cursorline
" visual autocomplete for command menu
" set tab completion behavior
set wildmenu
set wildmode=full
" highlight matching [{()}]
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
" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" }}}

" normal MISC {{{
" set file encode
set encoding=utf-8 fileencoding=uft-8
" }}}

" Learn Vim the Hard Way {{{
" move current line down
nnoremap _ ddkP
" move current line up
nnoremap _ ddp
" upper current word both in noremal mode and insert mode
inoremap <c-u> <esc>hviwUA
nnoremap <c-u> viwU
" edit myvimrc and source myvimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap " <esc>`<i"<esc>`>a"<esc>
iabbrev @@ guanglaihe@gmail.com
iabbrev personalpage knothhe.github.io
iabbrev khblog knothhe.github.io/blog
iabbrev ccpoy Copyright 2018 Guanglai He, all rights reserved.
"}}}

" vim-plug {{{
" Specify a directory for plugins
" - For vim: ~/.vim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" file directory
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" completion, for completion, consider ncm2
Plug 'Shougo/deoplete.nvim'
Plug 'jiangmiao/auto-pairs'
" ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
" c/c++ completion
Plug 'ncm2/ncm2-pyclang', { 'for' : ['c', 'c++']}
" python completion
Plug 'ncm2/ncm2-jedi', { 'for' : 'python' }
" move
Plug 'easymotion/vim-easymotion'
" comment
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
" text-object
Plug 'tpope/vim-surround'
" markdown
Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }
Plug 'iamcco/mathjax-support-for-mkdp', { 'for' : 'markdown' }
Plug 'iamcco/markdown-preview.vim', { 'for' : 'markdown' }
" UI
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
" git
" Plug 'tpope/vim-fugitive')
" search highlight
Plug 'haya14busa/is.vim'
" misc
Plug 'Yggdroot/LeaderF'
Plug 'echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans' }
" Plug 'w0rp/ale')
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
if has('unix')
    Plug 'vim-scripts/fcitx.vim'
endif
" Initialize plugin system
call plug#end()
" }}}

" deoplete {{{
" start deoplete when start vim/nvim
let g:deoplete#enable_at_startup = 1
" }}}

" NERDTree {{{
" key map
nnoremap <leader>ee :NERDTreeToggle<CR>

" show hidden files
let NERDTreeShowHidden=1
" }}}

" NERDcommentar {{{
let NERDRemoveExtraSpaces=0
let NERDDefaultAlign="start"
" }}}

" vim-airline {{{
let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" }}}

" rainbow {{{
let g:rainbow_active = 1

let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \   }
            \}
" }}}

" vim-markdown {{{
" cancel hide some markdown syntax
let g:vim_markdown_conceal = 0
" enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1
" }}}

" vim-molokai {{{
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
" }}}

" Limelight {{{
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

nmap <Leader>ll :Limelight!!<CR>
" xmap <Leader>l <Plug>(Limelight)
" }}}

" ncm2 {{{
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" }}}

" ncm2-pyclang {{{
" path to directory where libclang.so can be found
let g:ncm2_pyclang#library_path = '/usr/lib/llvm-6.0/lib'

" a list of relative paths for compile_commands.json
let g:ncm2_pyclang#database_path = [
            \ 'compile_commands.json',
            \ 'build/compile_commands.json'
            \ ]

autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
" }}}

""" translate-shell {{{
let g:trans_bin = "~/.vim"

nnoremap <silent> <leader>tt :Trans -t zh-CN<CR>
vnoremap <silent> <leader>tt :Trans -t zh-CN<CR>
nnoremap <silent> <leader>td :TransSelectDirection<CR>
vnoremap <silent> <leader>td :TransSelectDirection<CR> 
" }}}

" MISC {{{
" set python environment
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'
" :s change preview
if has('nvim')
    set inccommand=nosplit
endif
" true color
set termguicolors
" make the vim background transparent
"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE
hi! Normal ctermbg=none guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
set modelines=1
" vim:foldmethod=marker:foldlevel=0
