silent! runtime bundles.vim
runtime plugins/bclose.vim
"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------
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



"  ---------------------------------------------------------------------------
"	 AUTOCOMPLETE
"  ---------------------------------------------------------------------------
set completeopt=menu,longest
" set omnifunc=syntaxcomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------
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

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
set textwidth=79
set formatoptions=n
set nofoldenable

" check to make sure vim has been compiled with colorcolumn support
" before enabling it
if exists("+colorcolumn")
  set colorcolumn=80
endif


"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------
" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/

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

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
set wildignore+=**/build/**,**/target/**,**/cms-assets/**,**/tmp/**,**/vendor/**
set wildignore+=**/node_modules/**,**/bower_components/**
set wildignore+=**/doc/**,**/cache*/**

" Set a lower priority for .old files
set suffixes+=.old

" rvm-vim automatically as you switch from buffer to buffer
":autocmd BufEnter * Rvm

if exists(":Tabularize")
  nmap <Leader>v= :Tabularize /=<CR>
  vmap <Leader>v= :Tabularize /=<CR>
  nmap <Leader>v: :Tabularize /:\zs<CR>
  vmap <Leader>v: :Tabularize /:\zs<CR>
endif
"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------
set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/sh

" Finally, load custom configs
if filereadable($HOME . '.vimrc.local')
  source ~/.vimrc.local
endif


"Golang
" Automatically import packages on file save
let g:go_fmt_command = "goimports"
" Syntax highlight Functions, Methods, and Structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"  ---------------------------------------------------------------------------
"  Language Mappings
"  ---------------------------------------------------------------------------
if has("autocmd")
  " Other files to consider Ruby
  au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1

  " Python
  autocmd FileType python setl ts=4 sw=4 sts=4 noet

  " Golang
  " Bind Leader r to run current Go file
  au FileType go nmap <Leader>r <Plug>(go-run)
  " Bind Leader t to run current Go test suite
  au FileType go nmap <Leader>t <Plug>(go-test)
  " Bind Leader s to list interfaces for the type under cursor
  au FileType go nmap <Leader>s <Plug>(go-implements)
  " Bind Leader i to list type info for the type under cursor
  au FileType go nmap <Leader>i <Plug>(go-implements)
  autocmd FileType go setl ts=4 sw=4 sts=4 noet

  " CoffeeScript
  let coffee_compile_vert = 1
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

  autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

  " SASS / SCSS
  au BufNewFile,BufReadPost *.scss setl foldmethod=indent
  au BufNewFile,BufReadPost *.sass setl foldmethod=indent
  au BufRead,BufNewFile *.scss set filetype=scss
  autocmd BufNewFile, BufRead *.html.erb set filetype=html.erb

  autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
  highlight def link rubyRspec Function
endif


"  ---------------------------------------------------------------------------
"  Colors
"  ---------------------------------------------------------------------------

"  ---------------------------------------------------------------------------
"   MacVIM / Gvim / Terminal vim setting
"  ---------------------------------------------------------------------------
colorscheme jellybeans
if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA

  " Fonts
  " set guifont=Anonymous\ Pro\ for\ Powerline\ 11
  " set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13
  " set guifont=Roboto\ Mono\ for\ Powerline:h13
  " set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 14
  " set guifont=Inconsolata-g\ for\ Powerline:h13
  " set guifont=LiberationMono\ for\ Powerline\ 10
  " set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h15
  " set guifont=Source\ Code\ Pro\ for\ Powerline:h15
  " set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
  " set guifont=Monaco:h15
  set guifont=Hack:h13
  set bg=dark
  colorscheme ir_dark
endif





"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" eradicate all trailing whitespace all the time
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" CtrlP
nmap <leader>f :CtrlP<cr>
" let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore node_modules --ignore DS_Store --ignore git --ignore public/assets --ignore public/cached-assets --ignore public/cms-assets --ignore public/assets/source_maps --ignore doc --ignore public/uploads -g ""'
let g:ctrlp_use_caching = 1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Airline
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'onedark'

" Press F5 to toggle GUndo tree
nnoremap <F5> :GundoToggle<CR>

" indent file and return cursor and center cursor
map   <silent> <F6> mmgg=G`m^zz
imap  <silent> <F6> <Esc> mmgg=G`m^zz

" Add settings for tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Tabularize
if exists(":Tab")
  nmap <leader>a\| :Tab /\|<CR>
  vmap <leader>a\| :Tab /\|<CR>
  nmap <leader>a= :Tab /=<CR>
  vmap <leader>a= :Tab /=<CR>
  nmap <leader>a: :Tab /:\zs<CR>
  vmap <leader>a: :Tab /:\zs<CR>
endif

" Rpsec.vim
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %
