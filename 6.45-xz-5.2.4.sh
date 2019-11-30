#! /bin/bash

# xz-5.2.4
# Approximate build time: 0.2 SBU
# Required disk space: 16 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf xz-5.2.4.tar.xz
cd xz-5.2.4

# configure for compilation
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.4

# compile
make

# log test results to file
make check > $working/6.45-results.txt

# install
make install
mv -v   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin
mv -v /usr/lib/liblzma.so.* /lib
ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never xz-5.2.4
echo done
