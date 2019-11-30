#! /bin/bash

echo The following scripts will execute:
echo
echo 6.07-linux_headers.sh
echo 6.08-man-pages-5.02.sh
echo 6.09-glibc-2.30.sh
echo 6.10-toolchain.sh
echo 6.11-zlib-1.2.11.sh
echo 6.12-file-5.37.sh
echo 6.13-readline-8.0.sh
echo 6.14-M4-1.4.18.sh
echo 6.15-Bc-2.1.3.sh
echo 6.16-binutils-2.32.sh
echo 6.17-GMP-6.1.2.sh
echo 6.18-MPFR-4.0.2.sh
echo 6.19-MPC-1.1.0.sh
echo 6.20-shadow-4.7.sh
echo
echo press any key to begin...
read -n 1 -s
echo
bash 6.07-linux_headers.sh
bash 6.08-man-pages-5.02.sh
bash 6.09-glibc-2.30.sh
bash 6.10-toolchain.sh
bash 6.11-zlib-1.2.11.sh
bash 6.12-file-5.37.sh
bash 6.13-readline-8.0.sh
bash 6.14-M4-1.4.18.sh
bash 6.15-Bc-2.1.3.sh
bash 6.16-binutils-2.32.sh
bash 6.17-GMP-6.1.2.sh
bash 6.18-MPFR-4.0.2.sh
bash 6.19-MPC-1.1.0.sh
bash 6.20-shadow-4.7.sh
echo
echo done executing scripts.
echo Please set root password by entering passwd root