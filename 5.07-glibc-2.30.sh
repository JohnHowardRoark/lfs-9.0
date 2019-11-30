#! /bin/bash

# glibc-2.30
# Approximate build time: 4.8 SBU
# Required disk space: 896 MB

# record current working directory
working=$PWD

# unpack tarball
cd $LFS/sources
tar -xf glibc-2.30.tar.xz
cd glibc-2.30

# build in dedicated directory
mkdir build
cd build

# configure for compilation
../configure                             \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=/tools/include

# compile
make

# install
make install

#test toolchain
echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep ': /tools' > $working/5.07-results.txt
rm -v dummy.c a.out

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never glibc-2.30
echo done