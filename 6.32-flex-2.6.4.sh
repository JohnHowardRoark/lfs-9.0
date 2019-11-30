#! /tools/bin/bash

# flex-2.6.4
# Approximate build time: 0.5 SBU
# Required disk space: 36 MB

# record current dir and unpack tarball
working=$PWD
cd /sources
tar -xf flex-2.6.4.tar.gz
cd flex-2.6.4

# fix a problem
sed -i "/math.h/a #include <malloc.h>" src/flexdef.h

# skip amn page creation process due to missing help2man
HELP2MAN=/tools/bin/true \
./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4

# compile
make

# log test results to file
make check > $working/6.32-results.txt

# install
make install

# create symbolic link
ln -sv flex /usr/bin/lex

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never flex-2.6.4
echo done
