#! /bin/bash

# patch-2.7.6
# Approximate build time: 0.2 SBU
# Required disk space: 13 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf patch-2.7.6.tar.xz
cd patch-2.7.6

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.67-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never patch-2.7.6
echo done
