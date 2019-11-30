#! /tools/bin/bash

# adjusting the toolchain and checking

# record current directory and move to sources
working=$PWD
cd /sources

mv -v /tools/bin/{ld,ld-old}
mv -v /tools/$(uname -m)-pc-linux-gnu/bin/{ld,ld-old}
mv -v /tools/bin/{ld-new,ld}
ln -sv /tools/bin/ld /tools/$(uname -m)-pc-linux-gnu/bin/ld

gcc -dumpspecs | sed -e 's@/tools@@g'                   \
    -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
    -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' >      \
    `dirname $(gcc --print-libgcc-file-name)`/specs


echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib' > $working/6.10-results.txt
# should return no errors and:
# [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]


grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log >> $working/6.10-results.txt
# should return:
#/usr/lib/../lib/crt1.o succeeded
# /usr/lib/../lib/crti.o succeeded
# /usr/lib/../lib/crtn.o succeeded


grep -B1 '^ /usr/include' dummy.log >> $working/6.10-results.txt
# should return:
# #include <...> search starts here:
#  /usr/include


grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' >> $working/6.10-results.txt
# should return:
# SEARCH_DIR("/usr/lib")
# SEARCH_DIR("/lib")


grep "/lib.*/libc.so.6 " dummy.log >> $working/6.10-results.txt
# should return:
# attempt to open /lib/libc.so.6 succeeded


grep found dummy.log >> $working/6.10-results.txt
# should return:
# found ld-linux-x86-64.so.2 at /lib/ld-linux-x86-64.so.2

# cleanup
rm -v dummy.c a.out dummy.log
