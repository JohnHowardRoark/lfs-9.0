#! /bin/bash

# libpipeline-1.5.1
# Approximate build time: 0.1 SBU
# Required disk space: 9.0 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf libpipeline-1.5.1.tar.gz
cd libpipeline-1.5.1

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.65-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never libpipeline-1.5.1
echo done