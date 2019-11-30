#! /bin/bash

# expect5.45.4
# Approximate build time: 0.1 SBU
# Required disk space: 4.0 MB

# unpack tarball
cd $LFS/sources
tar -xf expect5.45.4.tar.gz
cd expect5.45.4

# patch
cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

# configure for compilation
./configure --prefix=/tools       \
            --with-tcl=/tools/lib \
            --with-tclinclude=/tools/include

# compile
make

# install
make SCRIPTS="" install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never expect5.45.4
echo done