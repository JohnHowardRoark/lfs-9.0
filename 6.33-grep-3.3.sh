#! /tools/bin/bash

# grep-3.3
# Approximate build time: 0.5 SBU
# Required disk space: 37 MB

# record working dir and unpack tarball
working=$PWD
cd /sources
tar -xf grep-3.3.tar.xz
cd grep-3.3

# prepare for compilation
./configure --prefix=/usr --bindir=/bin

# compile
make

# log test results to file
make -k check > $working/6.33-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never grep-3.3
echo done
