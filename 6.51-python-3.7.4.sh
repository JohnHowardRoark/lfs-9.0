#! /bin/bash

# Python-3.7.4
# Approximate build time: 1.3 SBU
# Required disk space: 399 MB

# unpack tarball
cd /sources
tar -xf Python-3.7.4.tar.xz
cd Python-3.7.4

# configure for compilation
./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes

# compile
make

# test suite cannot be run

# install
make install
chmod -v 755 /usr/lib/libpython3.7m.so
chmod -v 755 /usr/lib/libpython3.so
ln -sfv pip3.7 /usr/bin/pip3

# install documentation
install -v -dm755 /usr/share/doc/python-3.7.4/html 

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.7.4/html \
    -xvf ../python-3.7.4-docs-html.tar.bz2

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never Python-3.7.4
echo done
