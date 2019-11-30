#! /bin/bash

# Preparing virtual kernel file systems

# create directories where file systems will be mounted
mkdir -pv $LFS/{dev,proc,sys,run}

#  create initial device nodes
mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3

# bind mount /dev
mount -v --bind /dev $LFS/dev

# mount virtual kernel file systems
mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

# create needed directory
if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi
