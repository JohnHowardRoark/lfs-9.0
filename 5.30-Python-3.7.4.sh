#! /bin/bash

# Python-3.7.4
# Approximate build time: 1.4 SBU
# Required disk space: 381 MB

# unpack tarball
cd $LFS/sources
tar -xf Python-3.7.4.tar.xz
cd Python-3.7.4

# patch
sed -i '/def add_multiarch_paths/a \        return' setup.py

# configure for compilation
./configure --prefix=/tools --without-ensurepip

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never Python-3.7.4
echo done