#! /bin/bash

# m4-1.4.18
# Approximate build time: 0.2 SBU
# Required disk space: 20 MB

# unpack tarball
cd $LFS/sources
tar -xf m4-1.4.18.tar.xz
cd m4-1.4.18

# patch
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never m4-1.4.18
echo done