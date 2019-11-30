#! /tools/bin/bash

# GMP-6.1.2
# Approximate build time: 1.2 SBU
# Required disk space: 61 MB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf gmp-6.1.2.tar.xz
cd gmp-6.1.2

# prepare for compilation
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.1.2

# compile
make
make html

# log test results to file
make check 2>&1 | tee gmp-check-log
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log > $working/6.17-results.txt

# install
make install
make install-html

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never gmp-6.1.2
echo done
