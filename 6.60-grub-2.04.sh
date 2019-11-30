#! /bin/bash

# grub-2.04.tar.xz
# Approximate build time: 0.8 SBU
# Required disk space: 161 MB

# unpack tarball
cd /sources
tar -xf grub-2.04.tar.xz
cd grub-2.04

# configure for compilation
./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

# compile
make

# install
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never grub-2.04
echo done