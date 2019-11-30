#! /bin/bash

# XML-Parser-2.44
# Approximate build time: less than 0.1 SBU
# Required disk space: 2.3 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf XML-Parser-2.44.tar.gz
cd  XML-Parser-2.44

# configure for compilation
perl Makefile.PL

# compile
make

# log test results to file
make test > $working/6.41-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never XML-Parser-2.44
echo done
