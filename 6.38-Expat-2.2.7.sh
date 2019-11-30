#! /bin/bash

# expat-2.2.7
# Approximate build time: 0.1 SBU
# Required disk space: 11 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf expat-2.2.7.tar.xz
cd expat-2.2.7

# fix an issue with regression tests in the LFS environment
sed -i 's|usr/bin/env |bin/|' run.sh.in

# prepare to compile
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.2.7

# compile
make

# log test results to file
make check > $working/6.38-results.txt

# install
make install

# install documentation
install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.7

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never expat-2.2.7
echo done
