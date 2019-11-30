#! /bin/bash

# dejagnu-1.6.2
# Approximate build time: less than 0.1 SBU
# Required disk space: 3.2 MB

# unpack tarball
cd $LFS/sources
tar -xf dejagnu-1.6.2.tar.gz
cd dejagnu-1.6.2

# configure for compilation
./configure --prefix=/tools

# compile
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never dejagnu-1.6.2
echo done