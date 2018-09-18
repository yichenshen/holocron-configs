" Use ssh (comment out to use https)
" let g:plug_url_format='git@github.com:%s.git'

call plug#begin('~/.vim/plugged')

" Generic Vim functions
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'

" Searching and Browsing
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'derekwyatt/vim-fswitch'

" IDE functions
Plug 'tpope/vim-fugitive'
Plug 'Chiel92/vim-autoformat'
Plug 'skywind3000/asyncrun.vim'
Plug 'MattesGroeger/vim-bookmarks'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete languages
Plug 'Shougo/neco-vim'

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
Plug 'w0rp/ale'

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

call plug#end()
