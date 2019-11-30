#! /bin/bash

# gperf-3.1
# Approximate build time: less than 0.1 SBU
# Required disk space: 6.3 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf gperf-3.1.tar.gz
cd gperf-3.1

# prepare for compilation
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

# compile
make

# log test results to file
make -j1 check > 6.37-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never gperf-3.1
echo done
