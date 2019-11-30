#! /bin/bash

# procps-ng-3.3.15
# Approximate build time: 0.2 SBU
# Required disk space: 17 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf procps-ng-3.3.15.tar.xz
cd procps-ng-3.3.15

# configure for compilation
./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.15 \
            --disable-static                         \
            --disable-kill

# compile
make

# log test results to file
sed -i -r 's|(pmap_initname)\\\$|\1|' testsuite/pmap.test/pmap.exp
sed -i '/set tty/d' testsuite/pkill.test/pkill.exp
rm testsuite/pgrep.test/pgrep.exp
make check > $working/6.72-results.txt

# install
make install

# move libraries
mv -v /usr/lib/libprocps.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never procps-ng-3.3.15
echo done