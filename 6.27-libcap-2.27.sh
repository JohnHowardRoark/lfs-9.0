#! /tools/bin/bash

# libcap-2.27
# Approximate buld time: less than 0.1 SBU
# Required disk space: 1.5 MB

# unpack tarball
cd /sources
tar -xf libcap-2.27.tar.xz
cd libcap-2.27

# prevent installation of a static library
sed -i '/install.*STALIBNAME/d' libcap/Makefile

# compile
make

# install
make RAISE_SETFCAP=no lib=lib prefix=/usr install
chmod -v 755 /usr/lib/libcap.so.2.27

# recreate libraries
mv -v /usr/lib/libcap.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never libcap-2.27
echo done
