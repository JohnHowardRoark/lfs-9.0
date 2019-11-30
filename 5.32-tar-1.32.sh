#! /bin/bash

# tar-1.32
# Approximate build time: 0.3 SBU
# Required disk space: 38 MB

# unpack tarball
cd $LFS/sources
tar -xf tar-1.32.tar.xz
cd tar-1.32

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never tar-1.32
echo done