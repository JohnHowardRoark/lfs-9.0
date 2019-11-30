#! /bin/bash

# libtool-2.4.6
# Approximate build time: 1.9 SBU
# Required disk space: 43 MB

# record current dir and unpack tarball
working=$PWD
cd /sources
tar -xf libtool-2.4.6.tar.xz
cd libtool-2.4.6

# prepare for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.35-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never libtool-2.4.6
echo done
