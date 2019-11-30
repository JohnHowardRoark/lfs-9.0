#! /bin/bash

# findutils-4.6.0
# Approximate build time: 0.7 SBU
# Required disk space: 52 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf findutils-4.6.0.tar.gz
cd findutils-4.6.0

# suppress a test that can loop indefinitely
sed -i 's/test-lock..EXEEXT.//' tests/Makefile.in

# fixes required by glibc-2.28+
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c
sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c
echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h

# configure for compilation
./configure --prefix=/usr --localstatedir=/var/lib/locate

# compile
make

# log test results to file
make check > $working/6.58-results.txt

# install
make install

# correct a path
mv -v /usr/bin/find /bin
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never findutils-4.6.0
echo done
