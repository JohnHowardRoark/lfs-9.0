#! /bin/bash

# grep-3.3
# Approximate build time: 0.2 SBU
# Required disk space: 24 MB

# unpack tarball
cd $LFS/sources
tar -xf grep-3.3.tar.xz
cd grep-3.3

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never grep-3.3
echo done