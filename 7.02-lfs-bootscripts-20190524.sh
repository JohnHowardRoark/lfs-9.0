#! /bin/bash

# lfs-bootscripts-20190524
# Approximate build time: less than 0.1 SBU
# Required disk space: 244 KB

# unpack tarball
cd /sources
tar -xf lfs-bootscripts-20190524.tar.xz
cd lfs-bootscripts-20190524

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never lfs-bootscripts-20190524
echo done