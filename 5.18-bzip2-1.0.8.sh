#! /bin/bash

# bzip2-1.0.8
# Approximate build time: less than 0.1 SBU
# Required disk space: 6.0 MB

# unpack tarball
cd $LFS/sources
tar -xf bzip2-1.0.8.tar.gz
cd bzip2-1.0.8

# compile
make

# install
make PREFIX=/tools install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never bzip2-1.0.8
echo done