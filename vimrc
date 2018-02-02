call plug#begin('~/.vim/plugged')
Plug 'gmarik/vundle'

"#############################################################################
"  ---------------------------------------------------------------------------
" Tools
"  ---------------------------------------------------------------------------
"#############################################################################
Plug 'Townk/vim-autoclose'

" A code-completion engine for vim
" Plug 'Valloric/YouCompleteMe'

Plug 'ervandew/supertab'

Plug 'godlygeek/tabular'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'rking/ag.vim'

Plug 'scrooloose/syntastic'

" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'


Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" HTML completion with C-e (write haml style and transform to html)
Plug 'rstacruz/sparkup'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'vim-scripts/closetag.vim'

"#############################################################################
"  ---------------------------------------------------------------------------
" colorschemes
"  ---------------------------------------------------------------------------
"#############################################################################
Plug 'google/vim-colorscheme-primary'
Plug 'endel/vim-github-colorscheme'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasiser/vim-code-dark'
Plug 'twerth/ir_black'
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim'
Plug 'therealechan/vim-railscasts-theme'
Plug 'iCyMind/NeoSolarized'
Plug 'chriskempson/base16-vim'

"#############################################################################
"  ---------------------------------------------------------------------------
" Language Support
"  ---------------------------------------------------------------------------
"#############################################################################
Plug 'cakebaker/scss-syntax.vim'
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'keith/rspec.vim'
Plug 'amadeus/vim-mjml'


" More Highlighting for typescript
Plug 'HerringtonDarkholme/yats.vim'

" Typescript syntax highlighting
Plug 'leafgarland/typescript-vim'

" typescript IDE for vim
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim'

Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/jQuery'
Plug 'vim-scripts/SyntaxComplete'

Plug 'Shougo/neocomplete'

call plug#end()



"#############################################################################
"  General
"#############################################################################
filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
set modelines=0
syntax enable
set nobackup
set nowritebackup
set noswapfile
set history=1000
set autoread

set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"#############################################################################
" Typescript support
"#############################################################################
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

let g:acp_enableAtStartup = 0
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:tsuquyomi_completion_detail = 1

if has("autocmd")
  au BufRead,BufNewFile *.ts  set filetype=typescript
  au FileType typescript setlocal completeopt-=menu,preview
  au FileType typescript setlocal completeopt-=menu
endif

" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

"#############################################################################
" Golang support
"#############################################################################
let g:go_fmt_command = "goimports"

" Syntax highlight Functions, Methods, and Structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_hightlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:syntastic_go_checkers = ['go', 'govet', 'errcheck']

if has("autocmd")
  au FileType go nmap <Leader>b <Plug>(go-build)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>r <Plug>(go-run)
  au FileType go nmap <Leader>t <Plug>(go-test)
  au FileType go nmap gd <Plug>(go-def-tab)
  au FileType go setl ts=4 sw=4 sts=4 noet
endif

"#############################################################################
" Ruby support
"#############################################################################
if has("autocmd")
  " Other files to consider Ruby
  au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

  " autocmd FileType ruby set omnifunc=rubycomplete#Complete
  au FileType ruby let g:rubycomplete_buffer_loading = 1
  au FileType ruby let g:rubycomplete_classes_in_global = 1
  au FileType ruby let g:rubycomplete_rails = 1
  au BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
  highlight def link rubyRspec Function

  " au FileType ruby map <Leader>r :RuboCop -a<CR>
  au BufNewFile,BufRead *_spec.rb set filetype=rspec
  au FileType ruby compiler ruby
endif


"#############################################################################
"  ---------------------------------------------------------------------------
"	 AUTOCOMPLETE
"  ---------------------------------------------------------------------------
"#############################################################################
set completeopt=menu,longest
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete


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
set winheight=5
set winminheight=5
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


"#############################################################################
"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------
"#############################################################################

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" ACK
" set grepprg=ack
" nnoremap <leader>a :Ack<Space>

" New Tab
nnoremap <leader>t :tabnew<CR>

" Open Explor
nnoremap <leader>e :Explore<CR>


" AG
nnoremap <leader>a :Ag<Space>

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
" close buffer
nmap <leader>d :Bclose<CR>
" close all buffers
nmap <leader>D :bufdo bd<CR>

if exists(":Tabularize")
  nmap <Leader>g= :Tabularize /=<CR>
  vmap <Leader>g= :Tabularize /=<CR>
  nmap <Leader>g: :Tabularize /:\zs<CR>
  vmap <Leader>g: :Tabularize /:\zs<CR>
endif

"#############################################################################
"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------
"#############################################################################
set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
set wildignore+=**/build/**,**/target/**,**/cms-assets/**,**/tmp/**,**/vendor/**
set wildignore+=**/node_modules/**,**/bower_components/**
set wildignore+=**/doc/**,**/cache*/**

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/sh

"  ---------------------------------------------------------------------------
"  Language Mappings
"  ---------------------------------------------------------------------------
if has("autocmd")
  " Python
  autocmd FileType python setl ts=4 sw=4 sts=4 noet

  " CoffeeScript
  let coffee_compile_vert = 1
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

  " SASS / SCSS
  au BufNewFile,BufReadPost *.scss setl foldmethod=indent
  au BufNewFile,BufReadPost *.sass setl foldmethod=indent
  au BufRead,BufNewFile *.scss set filetype=scss
  autocmd BufNewFile, BufRead *.html.erb set filetype=html.erb
endif

"  ---------------------------------------------------------------------------
"   MacVIM / Gvim / Terminal vim setting
"  ---------------------------------------------------------------------------

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA

  set guifont=Dejavu\ Sans\ mono\ for\ powerline:h16
  set linespace=1
  set bg=dark
else
  if (empty($TMUX))
    if (has("termguicolors"))
      set termguicolors
    endif
  endif

  set t_Co=256
  set t_ut=
  colorscheme base16-materia
  " colorscheme base16-default-dark
  let g:airline_powerline_fonts = 1
endif

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" vim-scripts/DeleteTrailingWhitespace.git
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" CtrlP
nmap <leader>f :CtrlP<cr>
" let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore node_modules --ignore DS_Store --ignore git --ignore public/assets --ignore public/cached-assets --ignore public/cms-assets --ignore public/assets/source_maps --ignore doc --ignore public/uploads -g ""'
let g:ctrlp_use_caching = 1
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Airline
let g:Powerline_symbols = 'fancy'

" Add settings for tabular
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %
