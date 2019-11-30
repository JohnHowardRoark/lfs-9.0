#! /tools/bin/bash

# readline-8.0
# Approximate build time: 0.1 SBU
# Required disk space: 15 MB

# unpack the tarball
cd /sources
tar -xf readline-8.0.tar.gz
cd readline-8.0

# fix bug
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

# prepare for compilation
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/readline-8.0

# compile
make SHLIB_LIBS="-L/tools/lib -lncursesw"

# install
make SHLIB_LIBS="-L/tools/lib -lncursesw" install

# move dynamic libraries
mv -v /usr/lib/lib{readline,history}.so.* /lib
chmod -v u+w /lib/lib{readline,history}.so.*
ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so

# install documentation
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.0

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never readline-8.0
echo done
