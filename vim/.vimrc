" Use ssh (comment out to use https)
" let g:plug_url_format='git@github.com:%s.git'

call plug#begin('~/.vim/plugged')

" Generic Vim functions
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/restore_view.vim'

" Searching and Browsing
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'derekwyatt/vim-fswitch'

" IDE functions
Plug 'tpope/vim-fugitive'
Plug 'skywind3000/asyncrun.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-jedi'
Plug 'ponko2/deoplete-fish'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jiangmiao/auto-pairs'
Plug 'svermeulen/vim-easyclip'

" Status Display
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'hhvm/vim-hack'
Plug 'tpope/vim-endwise'
Plug 'vim-latex/vim-latex'
Plug 'davidhalter/jedi-vim'

" Themes
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
