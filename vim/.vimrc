" Use ssh (comment out to use https)
" let g:plug_url_format='git@github.com:%s.git'

call plug#begin('~/.vim/plugged')

" Searching and Browsing
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'derekwyatt/vim-fswitch'

" Editor Functions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'

" Status Display
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-syntastic/syntastic'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Language Support
Plug 'dag/vim-fish'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'vim-latex/vim-latex'
" Plug 'vim-scripts/nginx.vim'
" Plug 'keith/swift.vim'
" Plug 'solarnz/thrift.vim'

call plug#end()
