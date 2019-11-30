#! /tools/bin/bash

# mpc-1.1.0
# Approximate build time: 0.3 SBU
# Required disk space: 22 MB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf mpc-1.1.0.tar.gz
cd mpc-1.1.0

# prepare for compilation
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.1.0

# compile
make
make html

# log test results to file
make check > $working/6.19-results.txt

# install
make install
make install-html

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never mpc-1.1.0
echo done
