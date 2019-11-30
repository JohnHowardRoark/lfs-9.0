#! /bin/bash

# nano-4.4
# Approximate build time: 0.2 SBU
# Required disk space: 19 MB

# unpack tarball
cd /sources
tar -xf nano-4.4.tar.xz
cd nano-4.4

# configure for compilation
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-utf8     \
            --docdir=/usr/share/doc/nano-4.4 &&

# compile
make

# install
make install &&
install -v -m644 doc/{nano.html,sample.nanorc} /usr/share/doc/nano-4.4

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never nano-4.4
echo done