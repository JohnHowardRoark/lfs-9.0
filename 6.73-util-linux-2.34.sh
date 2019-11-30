#! /bin/bash

# util-linux-2.34
# Approximate build time: 1.2 SBU
# Required disk space: 283 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf util-linux-2.34.tar.xz
cd util-linux-2.34

# create directory for hwclock
mkdir -pv /var/lib/hwclock

# configure for compilation
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --docdir=/usr/share/doc/util-linux-2.34 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir

# compile
make

# log test results to file
chown -Rv nobody .
su nobody -s /bin/bash -c "PATH=$PATH make -k check" > $working/6.73-results.txt

# install
make install

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never util-linux-2.34
echo done
