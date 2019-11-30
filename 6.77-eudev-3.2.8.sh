#! /bin/bash

# eudev-3.2.8
# Approximate build time: 0.2 SBU
# Required disk space: 82 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf eudev-3.2.8.tar.gz
cd eudev-3.2.8

# configure for compilation
./configure --prefix=/usr           \
            --bindir=/sbin          \
            --sbindir=/sbin         \
            --libdir=/usr/lib       \
            --sysconfdir=/etc       \
            --libexecdir=/lib       \
            --with-rootprefix=      \
            --with-rootlibdir=/lib  \
            --enable-manpages       \
            --disable-static

# compile
make

# create some needed directories
mkdir -pv /lib/udev/rules.d
mkdir -pv /etc/udev/rules.d

# log test results to file
make check > $working/6.77-results.txt

# install
make install

# install custom rules and support files
tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install

# configuration
udevadm hwdb --update

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never eudev-3.2.8
echo done