#! /tools/bin/bash

# bison-3.4.1
# Approximate build time: 0.3 SBU
# Required disk space: 39 MB

# unpack tarball
cd /sources
tar -xf bison-3.4.1.tar.xz
cd bison-3.4.1

# fix a build problem
sed -i '6855 s/mv/cp/' Makefile.in

# prepare for compilation
./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.4.1

# compile
make -j1

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never bison-3.4.1
echo done
