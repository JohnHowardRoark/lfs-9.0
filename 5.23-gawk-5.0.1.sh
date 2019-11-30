#! /bin/bash

# gawk-5.0.1
# Approximate build time: 0.2 SBU
# Required disk space: 46 MB

# unpack tarball
cd $LFS/sources
tar -xf gawk-5.0.1.tar.xz
cd gawk-5.0.1

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never gawk-5.0.1
echo done