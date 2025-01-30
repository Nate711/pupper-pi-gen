#!/bin/bash -e

on_chroot << EOF
apt update
wget -q https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/ros2-desktop/debian/bookworm/ros-jazzy-desktop-0.3.2_20240525_arm64.deb
apt install -y ./ros-jazzy-desktop-0.3.2_20240525_arm64.deb
rm -f /usr/lib/python3.*/EXTERNALLY-MANAGED
pip install vcstool colcon-common-extensions --break-system-packages
echo 'source /opt/ros/jazzy/setup.bash' >> /home/$FIRST_USER_NAME/.bashrc
source /opt/ros/jazzy/setup.bash
EOF