#! /bin/bash

# gzip-1.10
# Approximate build time: 0.1 SBU
# Required disk space: 20 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf gzip-1.10.tar.xz
cd gzip-1.10

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.62-results.txt

# install
make install

# move a program to root
mv -v /usr/bin/gzip /bin

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never gzip-1.10
echo done
