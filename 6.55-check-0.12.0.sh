#! /bin/bash

# check-0.12.0
# Approximate build time: 3.7 SBU with tests
# Required disk space: 12 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf check-0.12.0.tar.gz
cd check-0.12.0

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.55-results.txt

# install
make docdir=/usr/share/doc/check-0.12.0 install

# fix a script
sed -i '1 s/tools/usr/' /usr/bin/checkmk

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never check-0.12.0
echo done.
