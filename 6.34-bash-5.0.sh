#! /tools/bin/bash

# bash-5.0
# Approximate build time: 2.1 SBU
# Required disk space: 62 MB

# record current dir and unpack tarball
working=$PWD
cd /sources
tar -xf bash-5.0.tar.gz
cd bash-5.0

# prepare for compilation
./configure --prefix=/usr                    \
            --docdir=/usr/share/doc/bash-5.0 \
            --without-bash-malloc            \
            --with-installed-readline

# compile
make

# prepare for tests
chown -Rv nobody .

# run tests as user nobody and log results to file
su nobody -s /bin/bash -c "PATH=$PATH HOME=/home make tests" > $working/6.34-results.txt

# install
make install
mv -vf /usr/bin/bash /bin

# log back in to the new bash
exec /bin/bash --login +h

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never bash-5.0
echo done
