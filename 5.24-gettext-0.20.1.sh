#! /bin/bash

# gettext-0.20.1
# Approximate build time: 1.8 SBU
# Required disk space: 300 MB

# unpack tarball
cd $LFS/sources
tar -xf gettext-0.20.1.tar.xz
cd gettext-0.20.1

# configure for compilation
./configure --disable-shared

# compile
make

# install
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /tools/bin

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never gettext-0.20.1
echo done