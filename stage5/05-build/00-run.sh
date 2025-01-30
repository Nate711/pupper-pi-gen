#!/bin/bash -e

on_chroot << EOF
bash /home/$FIRST_USER_NAME/pupperv3-monorepo/ros2_ws/build.sh
EOF