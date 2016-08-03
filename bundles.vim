set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off " must be off before Vundle has run
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Tools
Bundle 'kien/ctrlp.vim.git'
Bundle 'bling/vim-airline.git'
Bundle 'vim-scripts/DeleteTrailingWhitespace.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'Townk/vim-autoclose.git'
Bundle 'vim-scripts/closetag.vim'
Bundle 'rking/ag.vim.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'tpope/vim-rvm.git'
Bundle 'tpope/vim-bundler.git'
Bundle 'tpope/vim-fugitive'
Bundle 'ervandew/supertab.git'
Bundle 'godlygeek/tabular.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'shime/vim-livedown'
Bundle 'thoughtbot/vim-rspec.git'
Bundle 'FelikZ/ctrlp-py-matcher'

Bundle 'digitaltoad/vim-jade.git'
Bundle 'moll/vim-node'

" colorschemes
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'nanotech/jellybeans.vim.git'
Bundle 'therealechan/vim-railscasts-theme.git'
Bundle 'joshdick/onedark.vim'
Bundle 'joshdick/airline-onedark.vim'
Bundle 'croaky/vim-colors-github'
Bundle 'twerth/ir_black'

" Language Support
Bundle 'burnettk/vim-angular'
Bundle 'leafgarland/typescript-vim'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-haml.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'cakebaker/scss-syntax.vim.git'
Bundle 'vim-scripts/jQuery.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'Keithbsmiley/rspec.vim'
Bundle 'xsbeats/vim-blade.git'
Bundle 'fatih/vim-go.git'

filetype plugin indent on     " and turn it back on!

" Load plugins that ship with Vim {{{1
runtime macros/matchit.vim
runtime ftplugin/man.vim
