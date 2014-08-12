vim Installation
==

```
hg pull
hg update
make distclean
./configure --with-x --enable-fail-if-missing --enable-rubyinterp=dynamic --enable-multibyte --enable-fontset  --enable-gui=gtk2 --enable-gtk2-check --enable-gnome-check  --enable-motif-check --with-features=huge --with-compiledby='Hendrik Bergunde' --with-gnome
make
sudo make install
```



