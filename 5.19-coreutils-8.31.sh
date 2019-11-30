#! /bin/bash

# coreutils-8.31
# Approximate build time: 0.8 SBU
# Required disk space: 157 MB

# unpack tarball
cd $LFS/sources
tar -xf coreutils-8.31.tar.xz
cd coreutils-8.31

# configure for compilation
./configure --prefix=/tools --enable-install-program=hostname

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never coreutils-8.31
echo done