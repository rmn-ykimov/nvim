" - Settings -

" Mouse enabling.
set mouse=a
set encoding=utf-8
set number
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

" Search {{{
set incsearch " starts searching as soon as typing, without enter needed
set ignorecase " ignore letter case when searching
set smartcase " case insentive unless capitals used in search
" ctrl-b to remove search highlighting
noremap <C-b> :noh<cr>:call clearmatches()<cr>

set matchtime=2 " delay before showing matching paren
set mps+=<:>
" }}}

" Backup files {{{
set backup " use backup files
set noswapfile " do not use swap file
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
" }}}

" - Plugins -
call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'

Plug 'xiyaowong/nvim-transparent'

" Telescope.
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()
