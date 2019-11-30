#! /bin/bash

# Perl-5.30.0
# Approximate build time: 9.9 SBU
# Required disk space: 272 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf perl-5.30.0.tar.xz
cd perl-5.30.0

# create /etc/hosts file
echo "127.0.0.1 localhost $(hostname)" > /etc/hosts

# use libraries installed on the system
export BUILD_ZLIB=False
export BUILD_BZIP2=0

# configure for compilation
sh Configure -des -Dprefix=/usr                 \
                  -Dvendorprefix=/usr           \
                  -Dman1dir=/usr/share/man/man1 \
                  -Dman3dir=/usr/share/man/man3 \
                  -Dpager="/usr/bin/less -isR"  \
                  -Duseshrplib                  \
                  -Dusethreads

# compile
make

# log test results to file
make -k test > $working/6.40-results.txt

# install and cleanup
make install
unset BUILD_ZLIB BUILD_BZIP2

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never perl-5.30.0
echo done
