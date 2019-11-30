#! /bin/bash

# meson-0.51.1
# Approximate build time: less than 0.1 SBU
# Required disk space: 28 MB

# unpack tarball
cd /sources
tar -xf meson-0.51.1.tar.gz
cd meson-0.51.1

# compile
python3 setup.py build

# install
python3 setup.py install --root=dest
cp -rv dest/* /

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never meson-0.51.1
echo done
