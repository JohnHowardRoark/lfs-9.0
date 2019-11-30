#! /bin/bash

# findutils-4.6.0
# Approximate build time: 0.3 SBU
# Required disk space: 36 MB

# unpack tarball
cd $LFS/sources
tar -xf findutils-4.6.0.tar.gz
cd findutils-4.6.0

# patch
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c
sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c
echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h

# configure for compilation
./configure --prefix=/tools

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never findutils-4.6.0
echo done