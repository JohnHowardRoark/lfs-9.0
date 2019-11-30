#! /bin/bash

# kbd-2.2.0
# Approximate build time: 0.2 SBU
# Required disk space: 36 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf kbd-2.2.0.tar.xz
cd kbd-2.2.0

# patch
patch -Np1 -i ../kbd-2.2.0-backspace-1.patch

sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

# configure for compilation
PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr --disable-vlock

# compile
make

# log test results to file
make check > $working/6.64-results.txt

# install
make install

# install documentation
mkdir -v       /usr/share/doc/kbd-2.2.0
cp -R -v docs/doc/* /usr/share/doc/kbd-2.2.0

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never kbd-2.2.0
echo done