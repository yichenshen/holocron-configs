" Use ssh (comment out to use https)
" let g:plug_url_format='git@github.com:%s.git'

call plug#begin('~/.vim/plugged')

" Generic Vim functions
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/restore_view.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/plenary.nvim'

" Motion
Plug 'chaoren/vim-wordmotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/argtextobj.vim'

" Searching and Browsing
Plug 'jlanzarotta/bufexplorer'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'derekwyatt/vim-fswitch'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'folke/trouble.nvim'

" IDE functions
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'skywind3000/asyncrun.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'neovim/nvim-lspconfig'

" nvim-cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-cmdline'
Plug 'mtoohey31/cmp-fish'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-path'

" Editing
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'jiangmiao/auto-pairs'
Plug 'svermeulen/vim-easyclip'
Plug 'p00f/nvim-ts-rainbow'

" Status Display
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'seblj/nvim-echo-diagnostics'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'hhvm/vim-hack'
Plug 'tpope/vim-endwise'
Plug 'vim-latex/vim-latex'

" Themes
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
