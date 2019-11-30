#! /bin/bash

# linux-5.2.8
# Approximate build time: 0.1 SBU
# Required disk space: 960 MB

# unpack tarball
cd $LFS/sources
tar -xf linux-5.2.8.tar.xz
cd linux-5.2.8

# configure for compilation
make mrproper

# install
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never linux-5.2.8
echo done