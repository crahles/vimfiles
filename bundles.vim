set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off " must be off before Vundle has run
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"#############################################################################
"  ---------------------------------------------------------------------------
" Tools
"  ---------------------------------------------------------------------------
"#############################################################################
Bundle 'Townk/vim-autoclose.git'

" A code-completion engine for vim
" Bundle 'Valloric/YouCompleteMe'

Bundle 'ervandew/supertab.git'

Bundle 'godlygeek/tabular.git'

Bundle 'ctrlpvim/ctrlp.vim'

Bundle 'rking/ag.vim.git'

Bundle 'scrooloose/syntastic.git'

Bundle 'tomtom/tcomment_vim.git'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround.git'

" HTML completion with C-e (write haml style and transform to html)
Bundle 'rstacruz/sparkup'

Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

Bundle 'vim-scripts/DeleteTrailingWhitespace.git'
Bundle 'vim-scripts/closetag.vim'

"#############################################################################
"  ---------------------------------------------------------------------------
" colorschemes
"  ---------------------------------------------------------------------------
"#############################################################################
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'tomasiser/vim-code-dark'
Bundle 'twerth/ir_black'
Bundle 'rakr/vim-one'

"#############################################################################
"  ---------------------------------------------------------------------------
" Language Support
"  ---------------------------------------------------------------------------
"#############################################################################
Bundle 'cakebaker/scss-syntax.vim.git'
Bundle 'fatih/vim-go.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'digitaltoad/vim-pug'
Bundle 'keith/rspec.vim'


" More Highlighting for typescript
Bundle 'HerringtonDarkholme/yats.vim'

" Typescript syntax highlighting
Bundle 'leafgarland/typescript-vim'

" typescript IDE for vim
" Bundle 'Quramy/tsuquyomi'
" Bundle 'Shougo/vimproc.vim'

Bundle 'tpope/vim-haml.git'
Bundle 'tpope/vim-markdown.git'

Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'vim-scripts/jQuery.git'
Bundle 'vim-scripts/SyntaxComplete'

Bundle 'Shougo/neocomplete'

filetype plugin indent on     " and turn it back on!

" Load plugins that ship with Vim {{{1
runtime macros/matchit.vim
runtime ftplugin/man.vim
