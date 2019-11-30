#! /bin/bash

# Libelf from elfutils-0.177
# Approximate build time: 1.1 SBU
# Required disk space: 95 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf elfutils-0.177.tar.bz2
cd elfutils-0.177

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.48-results.txt

# install
make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never elfutils-0.177
echo done
