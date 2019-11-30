#! /bin/bash

# patch-2.7.6
# Approximate build time: 0.2 SBU
# Required disk space: 13 MB

# unpack tarball
cd $LFS/sources
tar -xf patch-2.7.6.tar.xz
cd patch-2.7.6

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never patch-2.7.6
echo done