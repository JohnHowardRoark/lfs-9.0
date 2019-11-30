#! /tools/bin/bash

# mpfr-4.0.2
# Approximate build time: 0.9 SBU
# Required disk space: 37 MB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf mpfr-4.0.2.tar.xz
cd mpfr-4.0.2

# prepare for compilation
./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.0.2

# compile
make
make html

# log test results to file
make check > $working/6.18-results.txt

# install
make install
make install-html

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never mpfr-4.0.2
echo done
