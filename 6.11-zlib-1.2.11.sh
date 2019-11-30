#! /tools/bin/bash

# Zlib-1.2.11
# Approximate build time: less than 0.1 SBU
# Required disk space: 5.1 MB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf zlib-1.2.11.tar.xz
cd zlib-1.2.11


# prepare for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.11-results.txt

# install
make install

# move shared library
mv -v /usr/lib/libz.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never zlib-1.2.11
echo done.
