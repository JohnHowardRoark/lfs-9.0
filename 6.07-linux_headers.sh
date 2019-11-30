#! /tools/bin/bash

# linux-5.2.8 API headers
# Approximate build time: less than 0.1 SBU
# Required disk space: 960 MB

# unpack the tarball
cd /sources
tar -xf linux-5.2.8.tar.xz
cd linux-5.2.8

# clean the kernel tree
make mrproper

# install headers
make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include

# cleanup source
cd /sources
rm -r --interactive=never linux-5.2.8
