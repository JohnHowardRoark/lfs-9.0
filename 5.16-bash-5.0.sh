#! /bin/bash

# bash-5.0
# Approximate build time: 0.4 SBU
# Required disk space: 67 MB

# unpack tarball
cd $LFS/sources
tar -xf bash-5.0.tar.gz
cd bash-5.0

# configure for compilation
./configure --prefix=/tools --without-bash-malloc

# compile
make

# install
make install

ln -sv bash /tools/bin/sh

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never bash-5.0
echo done