#! /tools/bin/bash

# gcc-9.2.0
# Approximate build time: 95 SBU
# Required disk space: 4.2 GB

# record current directory and unpack tarball
working=$PWD
cd /sources
tar -xf gcc-9.2.0.tar.xz
cd gcc-9.2.0

# change directory name for 64-bit binaries to lib
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

# create separate build directory
mkdir build
cd build

# prepare for compilation
SED=sed                               \
../configure --prefix=/usr            \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib

# compile
make

# increase stack size prior to testing
ulimit -s 32768

# test results as a non-privileged user
chown -Rv nobody . 
su nobody -s /bin/bash -c "PATH=$PATH make -k check"

# log summary of test results to file
../contrib/test_summary > $working/6.21-results.txt


# install
make install
rm -rf /usr/lib/gcc/$(gcc -dumpmachine)/9.2.0/include-fixed/bits/


# change ownership to root
chown -v -R root:root \
    /usr/lib/gcc/*linux-gnu/9.2.0/include{,-fixed}

# add simlinks
ln -sv ../usr/bin/cpp /lib
ln -sv gcc /usr/bin/cc

install -v -dm755 /usr/lib/bfd-plugins
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/9.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/

# log manual testing results to file
echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib' >> $working/6.21-manual.txt

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log >> $working/6.21-manual.txt

grep -B4 '^ /usr/include' dummy.log >> $working/6.21-manual.txt

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' >> $working/6.21-manual.txt

grep "/lib.*/libc.so.6 " dummy.log >> $working/6.21-manual.txt

grep found dummy.log >> $working/6.21-manual.txt

rm -v dummy.c a.out dummy.log

# move a misplaced file
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never gcc-9.2.0
echo done
