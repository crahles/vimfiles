## Requirements

Neovim
Tested on MacOS and Linux

## Quick Install

    curl https://raw.githubusercontent.com/DenniJensen/vimfiles/master/bootstrap.sh -o - | sh

## INSTALLATION

Note: If you are using RVM make sure you use system ruby before installation.

    rvm use system

Note: If you already have Vim installed ensure it has support for Ruby:

    vim --version | grep ruby

You should see `+ruby,` if you see `-ruby` you need to reinstall Vim with Ruby support

### Install Vim (if not already installed)

#### MacOS: MacVim / Vim

    brew install macvim --override-system-vim --enable-clipboard

Add `/usr/local/bin` before `/usr/bin` in your `$PATH` so you use the version of
vim installed by Homebrew, not the one that comes with MacOS.

By installing Vim in this way MacVim and regular Vim are exactly the same.

### Install these vimfiles

Note: You will already have a `~/.vim` folder, either delete or move it.

    mv ~/.vim ~/.vim.old
    git clone https://github.com/DenniJensen/vimfiles ~/.vim
    cd ~/.vim
    rake install

or run:

    curl https://raw.github.com/DenniJensen/vimfiles/master/bootstrap.sh -o - | sh

#### To update to the latest vimfiles

    cd ~/.vim
    ./update_bundles.sh

#### Install Dependacies

*MacOS*

    brew install ack
    brew install ctags

Note: MacOS comes with the BSD version of ctags which is not compatible.

*Ubuntu*

    sudo apt-get install exuberant-ctags
    sudo apt-get install ack-grep
    sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack

