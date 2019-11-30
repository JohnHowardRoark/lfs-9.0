#! /bin/bash

# sed-4.7
# Approximate build time: 0.2 SBU
# Required disk space: 20 MB

# unpack tarball
cd $LFS/sources
tar -xf sed-4.7.tar.xz
cd sed-4.7

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never sed-4.7
echo done