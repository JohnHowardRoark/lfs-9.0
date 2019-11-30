#! /tools/bin/bash

# M4-1.4.18
# Approximate build time: 0.4 SBU
# Required disk space: 33 MB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf m4-1.4.18.tar.xz
cd m4-1.4.18

# fixes required by glibc-2.28
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

# prepare for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.14-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never m4-1.4.18
echo done