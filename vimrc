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

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak


"  ---------------------------------------------------------------------------
" Plugins
"  ---------------------------------------------------------------------------
source plugin_configs/vim-colors-solarized.vim
source plugin_configs/airline.vim
source plugin_configs/ag.vim
source plugin_configs/t_comment.vim
source plugin_configs/auto_close.vim

syntax enable
set hlsearch


