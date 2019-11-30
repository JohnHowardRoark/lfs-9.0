#! /bin/bash

# diffutils-3.7
# Approximate build time: 0.2 SBU
# Required disk space: 26 MB

# unpack tarball
cd $LFS/sources
tar -xf diffutils-3.7.tar.xz
cd diffutils-3.7

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never diffutils-3.7
echo done