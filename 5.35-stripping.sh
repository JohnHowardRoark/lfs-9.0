#! /bin/bash

# remove debugging symbols
strip --strip-debug /tools/lib/*
/usr/bin/strip --strip-unneeded /tools/{,s}bin/*

# remove documentation
rm -rf /tools/{,share}/{info,man,doc}

# remove unneeded files
find /tools/{lib,libexec} -name \*.la -delete