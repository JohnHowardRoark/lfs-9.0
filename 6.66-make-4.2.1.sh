#! /bin/bash

# make-4.2.1
# Approximate build time: 0.6 SBU
# Required disk space: 13 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf make-4.2.1.tar.gz
cd make-4.2.1

# patch
sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make PERL5LIB=$PWD/tests/ check > $working/6.66-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never make-4.2.1
echo done
