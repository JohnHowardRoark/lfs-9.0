#! /bin/bash

# ninja-1.9.0
# Approximate build time: 0.2 SBU
# Required disk space: 69 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf ninja-1.9.0.tar.gz
cd ninja-1.9.0

# add capability for NINJAJOBS variable
sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc

# build
python3 configure.py --bootstrap

# log test results to file
./ninja ninja_test
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots > $working/6.52-results.txt

# install
install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never ninja-1.9.0
echo done
