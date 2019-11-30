#! /bin/bash

# tar-1.32
# Approximate build time: 2.2 SBU
# Required disk space: 45 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf tar-1.32.tar.xz
cd tar-1.32

# configure for compilation
FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin

# compile
make

# log test results to file
make check > $working/6.69-results.txt

# install
make install
make -C doc install-html docdir=/usr/share/doc/tar-1.32

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never tar-1.32
echo done
