#! /tools/bin/bash

# bzip2-1.0.8
# Approximate build time: less than 0.1 SBU
# Required disk space: 7.7 MB

# unpack the tarball
cd /sources
tar -xf bzip2-1.0.8.tar.gz
cd bzip2-1.0.8

# apply patch
patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch

sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile

sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile

# prepare for compilation
make -f Makefile-libbz2_so
make clean

# compile
make

# install
make PREFIX=/usr install

# install to /bin, make symbolic links, cleanup
cp -v bzip2-shared /bin/bzip2
cp -av libbz2.so* /lib
ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
rm -v /usr/bin/{bunzip2,bzcat,bzip2}
ln -sv bzip2 /bin/bunzip2
ln -sv bzip2 /bin/bzcat

# cleanup sources
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never bzip2-1.0.8
echo done
