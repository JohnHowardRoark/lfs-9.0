#! /bin/bash

# perl-5.30.0
# Approximate build time: 1.6 SBU
# Required disk space: 275 MB

# unpack tarball
cd $LFS/sources
tar -xf perl-5.30.0.tar.xz
cd perl-5.30.0

# configure for compilation
sh Configure -des -Dprefix=/tools -Dlibs=-lm -Uloclibpth -Ulocincpth

# compile
make

# install
cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.30.0
cp -Rv lib/* /tools/lib/perl5/5.30.0

# cleanup source
echo cleaning up source directory ...
cd $LFS/sources
rm -r --interactive=never perl-5.30.0
echo done