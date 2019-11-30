#! /tools/bin/bash

# man-pages-5.02
# Approximate build time: less than 0.1 SBU
# Required disk space: 31 MB

# unpack the tarball
cd /sources
tar -xf man-pages-5.02.tar.xz
cd man-pages-5.02

# install
make install

# cleanup source
cd /sources
rm -r --interactive=never man-pages-5.02
