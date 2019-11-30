#! /bin/bash

# 6.39 Inetutils-1.9.4
# Approximate build itme: 0.3 SBU
# Required disk space: 29 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf inetutils-1.9.4.tar.xz
cd inetutils-1.9.4

# configure for compiling
./configure --prefix=/usr        \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers

# compile
make

# log test results to file
make check > $working/6.39-results.txt

# install
make install

# move so programs
mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin
mv -v /usr/bin/ifconfig /sbin

# cleanup
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never inetutils-1.9.4
echo done
