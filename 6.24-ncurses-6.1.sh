#! /tools/bin/bash

# ncurses-6.1
# Approximate build time: 0.4 SBU
# Rerquired disk space: 42 MB

# unpack the tarball
cd /sources
tar -xf ncurses-6.1.tar.gz
cd ncurses-6.1

# do not install a static library not handled by configure
sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in

# prepare for compilation
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --enable-widec

# compile
make

# install
make install

# move shared libraries
mv -v /usr/lib/libncursesw.so.6* /lib

# recreate a symlink
ln -sfv ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so

# trick applications into linking with wide-character libraries
for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done

# check old apps still buildable
rm -vf                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
ln -sfv libncurses.so      /usr/lib/libcurses.so

# install documentation
mkdir -v       /usr/share/doc/ncurses-6.1
cp -v -R doc/* /usr/share/doc/ncurses-6.1

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never ncurses-6.1
echo done
