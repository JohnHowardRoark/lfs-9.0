#! /bin/bash

# binutils-2.32
# Approximate build time: 1 SBU
# Required disk space: 580 MB

# unpack tarball
cd $LFS/sources
tar -xf binutils-2.32.tar.xz
cd binutils-2.32

# build in dedicated directory
mkdir build
cd build

# configure for compilation
../configure --prefix=/tools            \
             --with-sysroot=$LFS        \
             --with-lib-path=/tools/lib \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror

# compile
make

# no testing

# create symlink
case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never binutils-2.32
echo done