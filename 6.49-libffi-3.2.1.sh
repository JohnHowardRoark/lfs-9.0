#! /bin/bash

# libffi-3.2.1
# Approximate build time: 0.4 SBU
# Required disk space: 7.6 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf libffi-3.2.1.tar.gz
cd libffi-3.2.1

# modify makefile to change headers install location
sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
    -i include/Makefile.in

sed -e '/^includedir/ s/=.*$/=@includedir@/' \
    -e 's/^Cflags: -I${includedir}/Cflags:/' \
    -i libffi.pc.in

# configure for compilation
./configure --prefix=/usr --disable-static --with-gcc-arch=native

# compile
make

# log test results to file
make check > $working/6.49-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never libffi-3.2.1
echo done
