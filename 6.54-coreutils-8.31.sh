#! /bin/bash

# coreutils-8.31
# Approximate build time: 2.5 SBU
# Required disk space: 202 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf coreutils-8.31.tar.xz
cd coreutils-8.31

# patch
patch -Np1 -i ../coreutils-8.31-i18n-1.patch

# suppress a test
sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk

# configure for compilation
autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

# compile
make

# log test results to file
make NON_ROOT_USERNAME=nobody check-root
echo "dummy:x:1000:nobody" >> /etc/group
chown -Rv nobody .
su nobody -s /bin/bash \
          -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check" > $working/6.54-results.txt

# remove temporary group
sed -i '/dummy/d' /etc/group

# install
make install

# move programs
mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
echo
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin
echo
mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
echo
mv -v /usr/bin/chroot /usr/sbin
echo
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
echo
sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8
echo
mv -v /usr/bin/{head,nice,sleep,touch} /bin
echo

# cleanup source
echo cleaning up source...
cd /sources
rm -r --interactive=never coreutils-8.31
echo done.