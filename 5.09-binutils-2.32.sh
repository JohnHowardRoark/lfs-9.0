#! /bin/bash

# binutils-2.32 - Pass 2
# Approximate build time: 1.1 SBU
# Required disk space: 879 MB

# unpack tarball
cd $LFS/sources
tar -xf binutils-2.32.tar.xz
cd binutils-2.32

# build in dedicated directory
mkdir build
cd build

# configure for compilation
CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../configure                   \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot

# compile
make

# install
make install

# prepare for next phase
make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never binutils-2.32
echo done