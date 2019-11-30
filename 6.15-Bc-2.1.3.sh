#! /tools/bin/bash

# Bc-2.1.3
# Approximate build time: 0.1 SBU
# Required disk space: 2.8 MB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf bc-2.1.3.tar.gz
cd bc-2.1.3

# configure for compilation
PREFIX=/usr CC=gcc CFLAGS="-std=c99" ./configure.sh -G -O3
# CC=gcc CFLAGS='-std=c99" specifies the complier and C standard to use
# -03 specifies the optimization to use
# -G omit parts of the test suite that do not work without GNU bc

# compile
make

# log test results to file
make test > $working/6.15-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never bc-2.1.3
echo done
