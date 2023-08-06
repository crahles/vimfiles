call plug#begin('~/vimfiles/plugged')

"#############################################################################
"  ---------------------------------------------------------------------------
" Tools
"  ---------------------------------------------------------------------------
" Archive for later

" Find a repace
" Plug 'brooth/far.vim'
"
" Allign code
" Plug 'godlygeek/tabular'

"#############################################################################
Plug 'Townk/vim-autoclose'


Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TODO replace this with fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Find stuff
Plug 'ggreer/the_silver_searcher'

" Syntax checker
" TODO(dh) - remove me
Plug 'scrooloose/syntastic'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" HTML completion with C-e (write haml style and transform to html)
" Plug 'rstacruz/sparkup'
Plug 'mattn/emmet-vim'

" This fucks up json and markdown
Plug 'Yggdroot/indentLine'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'alvan/vim-closetag'


"#############################################################################
"  ---------------------------------------------------------------------------
" colorschemes
"  ---------------------------------------------------------------------------
"#############################################################################
Plug 'rakr/vim-one'
Plug 'sainnhe/everforest'
"#############################################################################
"  ---------------------------------------------------------------------------
" Language Support
"  ---------------------------------------------------------------------------
"#############################################################################

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Toggle ruby blocks
Plug 'jgdavey/vim-blockle'

" Basic syntax highglighting for some languages
" e.g coffee
Plug 'sheerun/vim-polyglot'

" Plug 'kchmck/vim-coffee-script'
" Plug 'cakebaker/scss-syntax.vim'

" More Highlighting for typescript
Plug 'HerringtonDarkholme/yats.vim'

Plug 'tpope/vim-markdown'

Plug 'leafOfTree/vim-vue-plugin'

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml'

call plug#end()



"#############################################################################
"  General
"#############################################################################
filetype plugin indent on
let g:mapleader = " "
set modelines=0
syntax on
set nobackup
set nowritebackup
set noswapfile
set history=1000
set autoread

set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set autowrite
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes



"#############################################################################
" Typescript support
"#############################################################################
if has("autocmd")
  au BufRead,BufNewFile *.ts  set filetype=typescript
endif

let g:coc_global_extensions = [
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-solargraph',
      \ 'coc-tsserver',
      \ 'coc-tslint',
      \ 'coc-tslint-plugin',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-pyls',
      \ 'coc-yaml',
      \ 'coc-vetur'
      \]

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi']
" let g:tsuquyomi_completion_detail = 1

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

let g:acp_enableAtStartup = 0
" let g:SuperTabDefaultCompletionType = "<c-n>"


let g:closetag_filetypes = 'html,xhtml,phtml,vue'
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

let g:user_emmet_leader_key=','

"#############################################################################
" Golang support
"#############################################################################
let g:go_fmt_command = "goimports"
" Syntax highlight Functions, Methods, and Structs
let g:go_highlight_structs = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types =1
let g:go_highlight_functions_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['go', 'govet', 'errcheck']

" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"#############################################################################
" Ruby support
"#############################################################################

if has("autocmd")
  " Other files to consider Ruby
  au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

  " au BufRead,BufNewFile *_spec.rb set filetype=ruby.rspec
  highlight def link rubyRspec Function

  au FileType ruby compiler ruby
endif

"#############################################################################
"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------
"#############################################################################
set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set norelativenumber
set undofile
set nofoldenable

" Auto adjust window sizes when they become current
set winwidth=81
" set winheight=5
" set winminheight=5
set splitbelow splitright

"#############################################################################
"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------
"#############################################################################
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
set textwidth=79
set formatoptions=n
set nofoldenable

if exists("+colorcolumn")
  set colorcolumn=80
endif

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

"#############################################################################
"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------
"#############################################################################



" emmit
let g:user_emmet_leader_key=','

" TODO - make me work
if exists(":Tabularize")
  nmap <leader>g= :Tabularize /=<CR>
  vmap <leader>g= :Tabularize /=<CR>
  nmap <leader>g: :Tabularize /:\zs<CR>
  vmap <leader>g: :Tabularize /:\zs<CR>
endif

"#############################################################################
"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------
"#############################################################################
set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/zsh

"  ---------------------------------------------------------------------------
"  Language Mappings
"  ---------------------------------------------------------------------------
if has("autocmd")
  " Python
  autocmd FileType python setl ts=4 sw=4 sts=4 noet

  " mjml
  au BufRead,BufNewFile *.mjml set filetype=haml

  " CoffeeScript
  let coffee_compile_vert = 1
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

  " HTML / SASS / SCSS
  au BufNewFile,BufReadPost *.scss setl foldmethod=indent
  au BufNewFile,BufReadPost *.sass setl foldmethod=indent
  au BufNewFile,BufReadPost *.scss set filetype=scss
  " au BufNewFile,BufReadPost *.html.erb set filetype=html
endif

if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set t_Co=256
set t_ut=

colorscheme everforest

" soft / medium / hard
let g:everforest_background = 'medium'
set background=light

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" Airline
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]


" Show quotes in JSON File
set conceallevel=0
let g:vim_json_conceal=0
" let g:markdown_syntax_conceal=0

set rtp+=/usr/local/opt/fzf
let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

lua require('mappings')
lua require('config')

au CursorHold * checktime
au FocusGained * checktime

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .init.vim source %
autocmd! bufwritepost init.vim source %
