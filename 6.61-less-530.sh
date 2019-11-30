#! /bin/bash

# less-530
# Approximate build time: less than 0.1 SBU
# Required disk space: 4.1 MB

# unpack tarball
cd /sources
tar -xf less-530.tar.gz
cd less-530

# configure for compilation
./configure --prefix=/usr --sysconfdir=/etc

# compile
make

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never less-530
echo done
