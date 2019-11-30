#! /tools/bin/bash

# acl-2.2.53
# Approximate build time: less than 0.1 SBU
# Required disk space: 6.4 MB

# unpack tarball
cd /sources
tar -xf acl-2.2.53.tar.gz
cd acl-2.2.53

# prepare for compilation
./configure --prefix=/usr         \
            --bindir=/bin         \
            --disable-static      \
            --libexecdir=/usr/lib \
            --docdir=/usr/share/doc/acl-2.2.53

# compile
make

# install
make install

# recreate library
mv -v /usr/lib/libacl.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never acl-2.2.53
echo done
