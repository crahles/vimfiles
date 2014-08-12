silent! runtime bundles.vim

let mapleader = ","
let g:mapleader = ","

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------

set title
set encoding=utf-8
set number
set relativenumber

set splitbelow splitright

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=1
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
set textwidth=79
set formatoptions=n


"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch

source plugin_configs/vim-colors-solarized.vim
source plugin_configs/airline.vim
source plugin_configs/ag.vim

syntax enable
set hlsearch


