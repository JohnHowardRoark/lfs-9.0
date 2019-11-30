#! /tools/bin/bash

# binutils-2.32
# Approximate build time: 7.4 SBU
# Required disk space: 5.1 GB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf binutils-2.32.tar.xz
cd binutils-2.32

# verify PTYs and wait for keypress
# should return:
# spawn ls
echo confirm output is spawn ls
expect -c "spawn ls"
read -n 1 -s

# remove one test that prevents test compleion:
sed -i '/@\tincremental_copy/d' gold/testsuite/Makefile.in

# make dedicated build directory
mkdir build
cd build

# prepare for compilation
../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

# compile
make tooldir=/usr

# log test results to file
make -k check > $working/6.16-results.txt

# install
make tooldir=/usr install

# cleanup sources
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never binutils-2.32
echo done
