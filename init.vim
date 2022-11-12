" Mouse enabling.
set mouse=a
set encoding=utf-8
set number
set noswapfile
set scrolloff=7

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
"Load filetype-specific indent files.
filetype indent on

" For tabulation.
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'

Plug 'xiyaowong/nvim-transparent'

" Telescope.
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()