#! /bin/bash

# sysvinit-2.95
# Approximate build time: less than 0.1 SBU
# Required disk space: 1.3 MB

# unpack tarball
cd /sources
tar -xf sysvinit-2.95.tar.xz
cd sysvinit-2.95

# patch
patch -Np1 -i ../sysvinit-2.95-consolidated-1.patch

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never sysvinit-2.95
echo done