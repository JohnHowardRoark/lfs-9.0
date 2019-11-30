#! /bin/bash

# gawk-5.0.1
# Approximate build time: 0.4 SBU
# Required disk space: 47 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf gawk-5.0.1.tar.xz
cd gawk-5.0.1

# prevent installation of unneeded files
sed -i 's/extras//' Makefile.in

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.57-results.txt

# install
make install

# install documentation
mkdir -v /usr/share/doc/gawk-5.0.1
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.0.1

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never gawk-5.0.1 
echo done
