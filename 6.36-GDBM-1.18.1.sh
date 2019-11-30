#! /bin/bash

# gdbm-1.18.1
# Approximate build time: 0.1 SBU
# Required disk space: 11 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf gdbm-1.18.1.tar.gz
cd gdbm-1.18.1

# porepare for compilation
./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

# compile
make

# log test results to file
make check > $working/6.36-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never gdbm-1.18.1
echo done
