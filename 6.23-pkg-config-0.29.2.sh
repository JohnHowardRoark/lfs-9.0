#! /tools/bin/bash

# pkg-config-0.29.2
# Approximate build time: 0.4 SBU
# Required disk space: 30 MB

# record current dir and unpack tarball
working=$PWD
cd /sources
tar -xf pkg-config-0.29.2.tar.gz
cd pkg-config-0.29.2

# prepare for compilation
./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2

# compile
make

# log test results to file
make check > 6.23-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never pkg-config-0.29.2
echo done
