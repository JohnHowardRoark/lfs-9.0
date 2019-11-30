#! /bin/bash

# texinfo-6.6
# Approximate build time: 0.2 SBU
# Required disk space: 103 MB

# unpack tarball
cd $LFS/sources
tar -xf texinfo-6.6.tar.xz
cd texinfo-6.6

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never texinfo-6.6
echo done