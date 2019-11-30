#! /tools/bin/bash

# psmisc-23.2
# Approximate build time: less than 0.1 SBU
# Required disk space: 4.6 MB

# unpack tarball
cd /sources
tar -xf psmisc-23.2.tar.xz
cd psmisc-23.2

# prepare for compilation
./configure --prefix=/usr

# compile
make

# install
make install

# move programs to the location specified by the FHS
mv -v /usr/bin/fuser   /bin
mv -v /usr/bin/killall /bin

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never psmisc-23.2
echo done
