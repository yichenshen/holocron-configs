" Use ssh (comment out to use https)
" let g:plug_url_format='git@github.com:%s.git'

call plug#begin('~/.vim/plugged')

" Searching and Browsing
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'amix/open_file_under_cursor.vim'

" Editor Functions
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-syntastic/syntastic'
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'

" Status Display
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

" Language Support
Plug 'dag/vim-fish'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'vim-latex/vim-latex'
" Plug 'vim-scripts/nginx.vim'
Plug 'keith/swift.vim'

call plug#end()
