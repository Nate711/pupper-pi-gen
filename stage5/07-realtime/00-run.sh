#!/bin/bash -e

on_chroot << EOF

# Create realtime group is it doesn't exist
if ! getent group realtime > /dev/null; then
    addgroup realtime
fi

# Add user to the realtime group if they're not already there
if ! id -nG "$FIRST_USER_NAME" | grep -qw realtime; then
    usermod -a -G realtime $FIRST_USER_NAME
fi
EOF

cat <<EOL >> ${ROOTFS_DIR}/etc/security/limits.conf
@realtime soft rtprio 99
@realtime soft priority 99
@realtime soft memlock 102400
@realtime hard rtprio 99
@realtime hard priority 99
@realtime hard memlock 102400
EOL