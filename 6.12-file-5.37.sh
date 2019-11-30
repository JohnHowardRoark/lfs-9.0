#! /tools/bin/bash

# File-5.37
# Approximate build time: 0.1 SBU
# Required disk space: 19 MB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf file-5.37.tar.gz
cd file-5.37

# prepare for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.12-results.txt

# install
make install

# cleanup sources
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never file-5.37
echo done

