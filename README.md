vim Installation
==
Prerequisites (on Ubuntu & Linux Mint)
---
```
sudo apt-get install libpython3-dev libpython-dev libperl-dev libruby2.0 curl libx11-dev libxtst-dev libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev git mercurial terminator
```
You will need to use a good terminal emulator, such as terminator.

Install vim
---
... as we need it.

```
# do once:
mkdir ~/code
cd ~/code

hg clone https://vim.googlecode.com/hg/ vim
cd vim

# do regularly
cd ~/code/vim
hg pull
hg update
make distclean
./configure --with-x --enable-fail-if-missing --enable-rubyinterp=dynamic --enable-multibyte --enable-fontset --enable-gui=gtk2 --enable-gtk2-check --enable-gnome-check --enable-motif-check --with-features=huge --with-compiledby=Hendrik Bergunde --with-gnome --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-perlinterp=yes
make
sudo make install

# make sure everythin worked well:
# does the following command show a very recent version of vim?
# (i.e. not your distro's package version)
vim --version
```

Install vim configuration
---

```
git clone --branch=complete_clean_up https://github.com/hendrikb/vimfiles.git ~/.vim
cp ~/.vimrc ~/.vimrc.old ; ln -sf ~/.vim/vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim
./update_bundles.sh
```

Install most awesome  "Source Code Pro for Powerline" fonts on Ubuntu/Linux Mint
---
For Details on those fonts, that will make your vim will look pretty cool, check out the projects website:
https://github.com/Lokaltog/powerline-fonts

```
cd ~/code
git clone https://github.com/Lokaltog/powerline-fonts.git
cd powerline-fonts
./install
```

**You should now be able to able to use Vim from your command line.** :)
