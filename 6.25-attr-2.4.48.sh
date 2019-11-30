#! /tools/bin/bash

# attr-2.4.8
# Approximate build time: less than 0.1 SBU
# Required disk space: 4.2 MB

# record current dir and unpack tarball
working=$PWD
cd /sources
tar -xf attr-2.4.48.tar.gz
cd attr-2.4.48

# prepare for compilation
./configure --prefix=/usr     \
            --bindir=/bin     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.4.48

# compile
make

# log test results to file
make check > $working/6.25-results.txt

# install
make install

# recreate some libraries
mv -v /usr/lib/libattr.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never attr-2.4.48
echo done
