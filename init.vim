" add ~/.vimrc {{{  
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" }}}

" dein {{{ 
" close compatible mode
if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    " plugin
    call dein#add('~/.cache/dein')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('vim-airline/vim-airline')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('tpope/vim-surround')
    call dein#add('vim-scripts/AutoClose')
    call dein#add('luochen1990/rainbow')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('Yggdroot/indentLine')
    call dein#add('terryma/vim-multiple-cursors')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#end()
    call dein#save_state()
endif

" indent on depend on file type
filetype plugin indent on
syntax enable
" }}}

" deoplete {{{
" start deoplete when start vim/nvim
let g:deoplete#enable_at_startup = 1
" }}}

" NERDTree {{{ 
" key map
nnoremap <leader>e :NERDTreeToggle<CR>
" }}}

" MISC {{{
set modelines=1
" vim:foldmethod=marker:foldlevel=0
