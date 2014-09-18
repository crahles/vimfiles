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

set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
set textwidth=79
set formatoptions=n
set colorcolumn=80

set listchars=tab:>-,trail:·,extends:>,precedes:<,nbsp:❌
set list


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

" Switch, close buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>c :Bclose<CR>

" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" indent file and return cursor and center cursor
map   <silent> <F6> mmgg=G`m^zz
imap  <silent> <F6> <Esc> mmgg=G`m^zz

" binding.pry mappings
noremap <leader>d orequire 'pry'; binding.pry<ESC>
noremap <leader>D Orequire 'pry'; binding.pry<ESC>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp
set dir=/tmp

"  ---------------------------------------------------------------------------
" Plugins
"  ---------------------------------------------------------------------------
runtime plugin_config/vim-colors-solarized.vim
runtime plugin_config/airline.vim
runtime plugin_config/ag.vim
runtime plugin_config/t_comment.vim
runtime plugin_config/auto_close.vim
runtime plugin_config/ctrlp.vim
runtime plugin_config/bclose.vim
runtime plugin_config/chronos.vim

runtime plugin_config/omnifunc.vim


"  ---------------------------------------------------------------------------
" Syntax
"  ---------------------------------------------------------------------------

syntax enable
set hlsearch

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
