#! /bin/bash

# kmod-26
# Approximate build time: 0.1 SBU
# Required disk space: 13 MB

# unpack tarball
cd /sources
tar -xf kmod-26.tar.xz
cd kmod-26

# configure for compilation
./configure --prefix=/usr          \
            --bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zlib

# compile
make

# test package cannot be run in LFS environment

# install
make install

for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /sbin/$target
done

ln -sfv kmod /bin/lsmod

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never kmod-26
echo done
