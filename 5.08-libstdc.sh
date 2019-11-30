#! /bin/bash

# Libstdc++ from GCC-9.2.0
# Approximate build time: 0.5 SBU
# Required disk space: 879 MB

# unpack tarball
cd $LFS/sources
tar -xf gcc-9.2.0.tar.xz
cd gcc-9.2.0

# build in separate directory
mkdir build
cd build

# configure for compilation
../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --prefix=/tools                 \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-threads     \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/9.2.0

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never gcc-9.2.0
echo done