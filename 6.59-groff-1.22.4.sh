#! /bin/bash

# groff-1.22.4
# Approximate build time: 0.5 SBU
# Required disk space: 95 MB

# unpack tarball
cd /sources
tar -xf groff-1.22.4.tar.gz
cd groff-1.22.4

# prepare for compilation
PAGE=letter ./configure --prefix=/usr

# compile
make -j1

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never groff-1.22.4
echo done
