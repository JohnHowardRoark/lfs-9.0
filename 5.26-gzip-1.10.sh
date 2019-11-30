#! /bin/bash

# gzip-1.10
# Approximate build time: 0.1 SBU
# Required disk space: 10 MB

# unpack tarball
cd $LFS/sources
tar -xf gzip-1.10.tar.xz
cd gzip-1.10

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never gzip-1.10
echo done