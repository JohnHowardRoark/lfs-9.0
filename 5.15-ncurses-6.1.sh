#! /bin/bash

# ncurses-6.1
# Approximate build time: 0.6 SBU
# Required disk space: 41 MB

# unpack tarball
cd $LFS/sources
tar -xf ncurses-6.1.tar.gz
cd ncurses-6.1

# configure for compilation
sed -i s/mawk// configure

./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite

# compile
make

# install
make install
ln -s libncursesw.so /tools/lib/libncurses.so

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never ncurses-6.1
echo done