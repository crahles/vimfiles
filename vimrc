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
Plug 'endel/vim-github-colorscheme'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'twerth/ir_black'
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim'
Plug 'therealechan/vim-railscasts-theme'

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
" Plug 'Quramy/tsuquyomi'
" Plug 'Shougo/vimproc.vim'

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


autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"#############################################################################
" Golang support
"#############################################################################
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def-tab)

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

autocmd FileType ruby compiler ruby

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


"Golang

" Automatically import packages on file save
let g:go_fmt_command = "goimports"

" Syntax highlight Functions, Methods, and Structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_hightlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:syntastic_go_checkers = ['go', 'govet', 'errcheck']


"  ---------------------------------------------------------------------------
"  Language Mappings
"  ---------------------------------------------------------------------------
if has("autocmd")
  " Other files to consider Ruby
  au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

  " autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby let g:rubycomplete_rails = 1
  autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
  highlight def link rubyRspec Function
  " au FileType ruby map <Leader>r :RuboCop -a<CR>
  autocmd BufNewFile,BufRead *_spec.rb set filetype=rspec

  " Python
  autocmd FileType python setl ts=4 sw=4 sts=4 noet

  " Golang
  au FileType go nmap <Leader>r <Plug>(go-run)
  au FileType go nmap <Leader>t <Plug>(go-test)
  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <Leader>i <Plug>(go-implements)
  autocmd FileType go setl ts=4 sw=4 sts=4 noet

  " Typescript
  au BufRead,BufNewFile *.ts  set filetype=typescript
  autocmd FileType typescript setlocal completeopt-=menu,preview
  let g:tsuquyomi_completion_detail = 1

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

  " set guifont=Monacob2:h16
  " set guifont=Roboto\ mono\ for\ powerline:h16
  " set guifont=Dejavu\ Sans\ mono\ for\ powerline:h16
  set guifont=Hack:h15
  set linespace=1
  set bg=dark
else

  "Credit joshdick
  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (empty($TMUX))
    if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif

  set bg=dark

  colorscheme dracula

  let g:airline_theme='dracula'
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

" Press F5 to toggle GUndo tree
nnoremap <F5> :GundoToggle<CR>

" Add settings for tabular
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %
