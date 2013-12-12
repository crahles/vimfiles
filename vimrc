" vim: nowrap fdm=marker
"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

silent! runtime bundles.vim
runtime plugins/bclose.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------

filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
set modelines=0
set history=10000
set nobackup
set nowritebackup
set noswapfile
syntax enable
set autoread

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
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set undofile

set splitbelow splitright

if has('mouse')
  set mouse=a
endif

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

" check to make sure vim has been compiled with colorcolumn support
" before enabling it
if exists("+colorcolumn")
  set colorcolumn=80
endif

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
set hlsearch

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Ag/the_silver_searcher
nnoremap <leader>a :Ag<space>

" Easy commenting
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
" close buffer

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
" Set a lower priority for .old files
set suffixes+=.old

" rvm-vim automatically as you switch from buffer to buffer
" :autocmd BufEnter * Rvm

"  ---------------------------------------------------------------------------
"  Function Keys
"  ---------------------------------------------------------------------------

" Press F5 to toggle GUndo tree
nnoremap <F5> :GundoToggle<CR>

" indent file and return cursor and center cursor
map   <silent> <F6> mmgg=G`m^zz
imap  <silent> <F6> <Esc> mmgg=G`m^zz

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" CtrlP
nmap <leader>f :CtrlP<cr>

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

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------

set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/bash

" Finally, load custom configs
if filereadable($HOME . '.vimrc.local')
  source ~/.vimrc.local
endif

"  ---------------------------------------------------------------------------
"  GnomeTerminal
"  ---------------------------------------------------------------------------
set t_Co=256

"  ---------------------------------------------------------------------------
"  Colors
"  ---------------------------------------------------------------------------
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" colorscheme skittles_berry

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %

noremap <leader>d orequire 'pry'; binding.pry<ESC>
noremap <leader>D Orequire 'pry'; binding.pry<ESC>

nmap <leader>t :w<CR>\|:execute "!bundle exec rspec %:" . line('.')<CR>
nmap <leader>c :Bclose<CR>

function! Buflist()
    redir => bufnames
    silent ls
    redir END
    let list = []
    for i in split(bufnames, "\n")
        let buf = split(i, '"' )
        call add(list, buf[-2])
|   endfor
    return list
endfunction

function! Bdeleteonly()
    let list = filter(Buflist(), 'v:val != bufname("%")')
    for buffer in list
        exec "bdelete ".buffer
    endfor
endfunction

command! Bonly :silent call Bdeleteonly()



" Specname function {{{
" returns the corresponding spec name for a file
function! Specname()
  let filename = @%
  if filename =~? '_spec.rb'
    return filename
  else
    let filename = substitute(filename, ".rb", "_spec.rb", "")
    if filename =~? 'app/'
      return substitute(filename, "app/", "spec/", "")
    elseif filename =~? 'lib/'
      return substitute(filename, "lib/", "spec/lib/", "")
    else
      return filename
    endif
  endif
endfunction
" }}}

" run current file with rspec
noremap <leader>T :execute "!clear && zeus rspec " . Specname()<CR>
noremap <leader>t :execute "!clear && bundle exec rspec " . Specname()<CR>
" run spec in current line
noremap <leader>R :execute "!clear && zeus rspec " . Specname(). ":" . line('.')<CR>
noremap <leader>r :execute "!clear && bundle exec rspec " . Specname(). ":" . line('.')<CR>

" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

:nnoremap <leader>os :execute "vsplit " . Specname()<cr>

"  ---------------------------------------------------------------------------
"  Airline Configuration
"  ---------------------------------------------------------------------------
let g:airline_powerline_fonts=1

"  ---------------------------------------------------------------------------
"  Language Mappings
"  ---------------------------------------------------------------------------

" Other files to consider Ruby
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,[Vv]agrantfile,Guardfile,Capfile set filetype=ruby

" Python
autocmd FileType python set sw=4 sts=4 et

" CoffeeScript
let coffee_compile_vert = 1
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" SASS / SCSS
au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

" nginx
au BufRead,BufNewFile nginx.conf,/etc/nginx/sites-*/* set filetype=nginx
