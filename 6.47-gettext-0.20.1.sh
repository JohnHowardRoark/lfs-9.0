#! /bin/bash

# gettext-0.20.1
# Approximate build time: 2.9 SBU
# Required disk space: 249 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf gettext-0.20.1.tar.xz
cd gettext-0.20.1

# configure for compilation
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.20.1

# compile
make

# log test results to file
make check > $working/6.47-results.txt

# install
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never gettext-0.20.1
echo done
