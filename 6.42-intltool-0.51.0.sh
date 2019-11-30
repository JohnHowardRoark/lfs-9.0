#! /bin/bash

# intltool-0.51.0
# Approximate build time: less than 0.1 SBU
# Required disk space: 1.5 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf intltool-0.51.0.tar.gz
cd intltool-0.51.0

# fix a warning
sed -i 's:\\\${:\\\$\\{:' intltool-update.in

# configure for compilation
./configure --prefix=/usr

# compile
make

# log test results to file
make check > $working/6.42-results.txt

# install
make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never intltool-0.51.0
echo done
