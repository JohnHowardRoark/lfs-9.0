#! /bin/bash

# e2fsprogs-1.45.3
# Approximate build time: 3.1 SBU
# Required disk space: 108 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf e2fsprogs-1.45.3.tar.gz
cd e2fsprogs-1.45.3

# create build directory
mkdir build
cd build

# configure for compilation
../configure --prefix=/usr           \
             --bindir=/bin           \
             --with-root-prefix=""   \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck

# compile
make

# log test results to file
make check > $working/6.74-results.txt

# install
make install
make install-libs
chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info
makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never e2fsprogs-1.45.3
echo done