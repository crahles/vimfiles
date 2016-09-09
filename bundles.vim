set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off " must be off before Vundle has run
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Tools
Bundle 'FelikZ/ctrlp-py-matcher'
Bundle 'Townk/vim-autoclose.git'
Bundle 'ervandew/supertab.git'
Bundle 'godlygeek/tabular.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'rking/ag.vim.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'shime/vim-livedown'
Bundle 'sjl/gundo.vim.git'
Bundle 'thoughtbot/vim-rspec.git'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'tpope/vim-bundler.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rvm.git'
Bundle 'tpope/vim-surround.git'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'vim-scripts/DeleteTrailingWhitespace.git'
Bundle 'vim-scripts/closetag.vim'

Bundle 'digitaltoad/vim-jade.git'
Bundle 'moll/vim-node'

" colorschemes
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'antlypls/vim-colors-codeschool'
Bundle 'joshdick/onedark.vim'
Bundle 'nanotech/jellybeans.vim.git'
Bundle 'therealechan/vim-railscasts-theme.git'
Bundle 'twerth/ir_black'
Bundle 'rakr/vim-one'

" Language Support
Bundle 'Keithbsmiley/rspec.vim'
Bundle 'burnettk/vim-angular'
Bundle 'cakebaker/scss-syntax.vim.git'
Bundle 'fatih/vim-go.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'leafgarland/typescript-vim'
Bundle 'tpope/vim-haml.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'vim-scripts/jQuery.git'
Bundle 'xsbeats/vim-blade.git'

filetype plugin indent on     " and turn it back on!

" Load plugins that ship with Vim {{{1
runtime macros/matchit.vim
runtime ftplugin/man.vim
