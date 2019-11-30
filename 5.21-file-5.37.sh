#! /bin/bash

# file-5.37
# Approximate build time: 0.1 SBU
# Required disk space: 19 MB

# unpack tarball
cd $LFS/sources
tar -xf file-5.37.tar.gz
cd file-5.37

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never file-5.37
echo done