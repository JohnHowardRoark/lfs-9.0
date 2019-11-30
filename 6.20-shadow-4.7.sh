#! /tools/bin/bash

# shadow-4.7
# Approximate build time: 0.2 SBU
# Required disk space: 46 MB

# unpack the tarball
cd /sources
tar -xf shadow-4.7.tar.xz
cd shadow-4.7


# some adjustments
sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
       -e 's@/var/spool/mail@/var/mail@' etc/login.defs

sed -i 's/1000/999/' etc/useradd


# prepare for compilation
./configure --sysconfdir=/etc --with-group-name-max-length=32

# compile
make

# install
make install


# move a misplaced program to the correct location
mv -v /usr/bin/passwd /bin


# configuring to allow shadowed user and group passwords
pwconv
grpconv


# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never shadow-4.7
echo done
