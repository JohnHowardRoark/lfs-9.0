#! /bin/bash

# man-db-2.8.6.1
# Approximate build time: 0.4 SBU
# Required disk space: 38 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf man-db-2.8.6.1.tar.xz
cd man-db-2.8.6.1

# configure for compilation
./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.8.6.1 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap            \
            --with-systemdtmpfilesdir=           \
            --with-systemdsystemunitdir=

# compile
make

# log test results to file
make check > $working/6.68-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never man-db-2.8.6.1
echo done
