#! /bin/bash

# iproute2-5.2.0
# Approximate build time: 0.2 SBU
# Required disk space: 13 MB

# unpack tarball
cd /sources
tar -xf iproute2-5.2.0.tar.xz
cd iproute2-5.2.0

# some adjustments
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

sed -i 's/.m_ipt.o//' tc/Makefile

# compile
make

# install
make DOCDIR=/usr/share/doc/iproute2-5.2.0 install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never iproute2-5.2.0
echo done
