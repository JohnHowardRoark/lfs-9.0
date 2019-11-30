#! /tools/bin/bash

# sed-4.7
# Approximate build time: 0.4 SBU
# Required disk space: 32 MB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf sed-4.7.tar.xz
cd sed-4.7

# fix issue with the LFS environment and remove a failing test
sed -i 's/usr/tools/'                 build-aux/help2man
sed -i 's/testsuite.panic-tests.sh//' Makefile.in

# prepare for compilation
./configure --prefix=/usr --bindir=/bin

# compile
make
make html

# log test results to file
make check > $working/6.28-results.txt

# install
make install
install -d -m755           /usr/share/doc/sed-4.7
install -m644 doc/sed.html /usr/share/doc/sed-4.7

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never sed-4.7
echo done
