#! /tools/bin/bash

# iana-etc-2.30
# Approximate build time: less than 0.1 SBU
# Required disk space: 2.3 MB

# unpack tarball
cd /sources
tar -xf iana-etc-2.30.tar.bz2
cd iana-etc-2.30

# compile and install
make && make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never iana-etc-2.30
echo done
