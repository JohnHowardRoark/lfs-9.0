#! /bin/bash

# Use this script to remount the virtual files systems before
# compiling the kernel.

# change to root
# exec env -i su - root
echo This will not execute if you are not root.
echo  Press any key to continue.
read -n 1 -s


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

# chroot to LFS environment
chroot "$LFS" /usr/bin/env -i          \
    HOME=/root TERM="$TERM"            \
    PS1='(lfs chroot) \u:\w\$ '        \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login
