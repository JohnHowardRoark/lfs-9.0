#! /bin/bash

# diffutils-3.7
# Approximate build time: 0.4 SBU
# Required disk space: 36 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf diffutils-3.7.tar.xz
cd diffutils-3.7

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.56-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never diffutils-3.7
echo done
