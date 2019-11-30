#! /bin/bash

# bison-3.4.1
# Approximate build time: 0.3 SBU
# Required disk space: 39 MB

# unpack tarball
cd $LFS/sources
tar -xf bison-3.4.1.tar.xz
cd bison-3.4.1

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never bison-3.4.1
echo done