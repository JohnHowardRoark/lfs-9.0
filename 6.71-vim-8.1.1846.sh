#! /bin/bash

# vim-8.1.1846
# Approximate build time: 2.2 SBU
# Required disk space: 190 MB

# record current working directory
working=$PWD

# unpack tarball
cd /sources
tar -xf vim-8.1.1846.tar.gz
cd vim-8.1.1846

# configure for compilation
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
./configure --prefix=/usr

# compile
make

# log test results to file
chown -Rv nobody .

# install
su nobody -s /bin/bash -c "LANG=en_US.UTF-8 make -j1 test" &> $working/6.71-vim-test.log

# symlink for vi
ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

ln -sv ../vim/vim81/doc /usr/share/doc/vim-8.1.1846

# configuring Vim
cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1 

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never vim-8.1.1846
echo done
