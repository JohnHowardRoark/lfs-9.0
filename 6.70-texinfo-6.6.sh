#! /bin/bash

# texinfo-6.6
# Approximate build time: 0.8 SBU
# Required disk space: 122 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf texinfo-6.6.tar.xz
cd texinfo-6.6

# configure for compilation
./configure --prefix=/usr --disable-static

# compile
make

# log test results to file
make check > $working/6.70-results.txt

# install
make install

# optional install of components for TeX:
make TEXMF=/usr/share/texmf install-tex

# run if needed to recreate menu entries
pushd /usr/share/info
rm -v dir
for f in *
  do install-info $f dir 2>/dev/null
done
popd

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never texinfo-6.6
echo done