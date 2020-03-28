#!/bin/bash

if [ "$3" == "" ] ; then
    echo "A build directory must be specified!"
    exit 1
fi

# create a group with a proper id, in case it doesn't exist
if ! cat /etc/group | grep ":$2:" > /dev/null 2>&1 ; then
    groupadd -g $2 builder
fi

# Add uid, gid for builder, in case it doesn't exist
if ! cat /etc/passwd | grep ":$1:" > /dev/null 2>&1 ; then
    useradd -m -u $1 -g $2 -s /bin/bash builder
fi

# Use bash as the default shell
ln -sf /bin/bash /bin/sh

# Zap the password for builder
[ -e /etc/shadow ] && sed -i 's%^builder:.:%builder::%' /etc/shadow
[ -e /etc/passwd ] && sed -i 's%^builder:x:%builder::%' /etc/passwd

echo -e "\n# Builder privilege specification\nbuilder ALL=NOPASSWD: ALL" >> /etc/sudoers

[ -c "$(tty)" ] && chmod a+rw $(tty)

cp -rp /opt/yocto-build/docker/home /
chown -R builder: /home/builder

# Set correct variables according to the passed parameters
sed -i "s#@@BUILD_DIR@@#$3#" /home/builder/.bashrc

# Start builder
if [ "$7" != "" ] ; then
    su - builder -c "$7"
    exit $?
fi

su - builder
