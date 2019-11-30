#! /bin/bash

# openssl-1.1.1c
# Approximate build time: 2.3 SBU
# Required disk space: 147 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf openssl-1.1.1c.tar.gz
cd openssl-1.1.1c

# fix package issue
sed -i '/\} data/s/ =.*$/;\n    memset(\&data, 0, sizeof(data));/' \
  crypto/rand/rand_lib.c

# configure for compilation
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

# compile
make

# log test results to file
make test > $working/6.50-results.txt

# install
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

# install documentation
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.1c
cp -vfr doc/* /usr/share/doc/openssl-1.1.1c

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never openssl-1.1.1c
echo done
