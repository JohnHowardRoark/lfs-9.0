#! /bin/bash

# Autoconf-2.69
# Approximate build time: 3.4 SBU with tests
# Required disk space: 79 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf autoconf-2.69.tar.xz
cd autoconf-2.69

# fix a bug
sed '361 s/{/\\{/' -i bin/autoscan.in

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.43-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never autoconf-2.69
echo done
