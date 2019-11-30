#! /bin/bash

# tcl8.6.9-src
# Approximate build time: 0.9 SBU
# Required disk space: 71 MB

# unpack tarball
cd $LFS/sources
tar -xf tcl8.6.9-src.tar.gz
cd tcl8.6.9

# configure for compilation
cd unix
./configure --prefix=/tools

# compile
make

# install
make install

chmod -v u+w /tools/lib/libtcl8.6.so

make install-private-headers

ln -sv tclsh8.6 /tools/bin/tclsh

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never tcl8.6.9
echo done