#! /bin/bash

# sysklogd-1.5.1
# Approximate build time: less than 0.1 SBU
# Required disk space: 0.6 MB

# unpack tarball
cd /sources
tar -xf sysklogd-1.5.1.tar.gz
cd sysklogd-1.5.1

# patch
sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c

# compile
make

# install
make BINDIR=/sbin install

# configuration
cat > /etc/syslog.conf << "EOF"
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF

# cleanup source
echo cleaning up source directory ...
cd /sources
rm -r --interactive=never sysklogd-1.5.1
echo done
