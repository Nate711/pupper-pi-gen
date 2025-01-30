#!/bin/bash -e

on_chroot << EOF
addgroup realtime
usermod -a -G realtime $FIRST_USER_NAME
EOF

cat <<EOL >> ${ROOTFS_DIR}/etc/security/limits.conf
@realtime soft rtprio 99
@realtime soft priority 99
@realtime soft memlock 102400
@realtime hard rtprio 99
@realtime hard priority 99
@realtime hard memlock 102400
EOL