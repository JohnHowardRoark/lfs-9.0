#! /bin/bash

# xz-5.2.4
# Approximate build time: 0.2 SBU
# Required disk space: 18 MB

# unpack tarball
cd $LFS/sources
tar -xf xz-5.2.4.tar.xz
cd xz-5.2.4

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never xz-5.2.4
echo done