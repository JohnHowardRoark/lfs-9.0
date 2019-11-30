#! /bin/bash

# automake-1.16.1
# Approximate build time: 8.7 SBU with tests
# Required disk space: 107 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf automake-1.16.1.tar.xz
cd automake-1.16.1

# configure for compilation
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.1

# compile
make

# log test results to file
make -j4 check > $working/6.44-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never automake-1.16.1
echo done
