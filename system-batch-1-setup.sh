#! /bin/bash

echo The following scripts will execute:
echo
echo 6.02-virtual-file-systems.sh
echo 6.04-chroot.sh
echo 6.05-dirs.sh
echo 6.06-files_symlinks.sh
echo
echo Press any key to begin...
read -n 1 -s
echo
bash 6.02-virtual-file-systems.sh
bash 6.04-chroot.sh
bash 6.05-dirs.sh
bash 6.06-files_symlinks.sh
echo
echo done executing scripts.