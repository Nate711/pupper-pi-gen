#!/bin/bash -e

on_chroot << EOF
pip install typeguard --break-system-packages
pip uninstall em
pip install empy==3.3.4 --break-system-packages

mkdir /home/$FIRST_USER_NAME/pupperv3-monorepo/ros2_ws/src/common
cd /home/$FIRST_USER_NAME/pupperv3-monorepo/ros2_ws/src/common

repos=(
    "https://github.com/pal-robotics/backward_ros.git"
    "https://github.com/PickNikRobotics/RSL.git"
    "https://github.com/PickNikRobotics/generate_parameter_library.git"
    "https://github.com/ros-controls/realtime_tools.git"
    "https://github.com/ros-controls/control_msgs.git"
    "https://github.com/ros/diagnostics.git"
    "https://github.com/ros2/teleop_twist_joy.git"
    "https://github.com/ros-drivers/joystick_drivers.git -b ros2"
    "https://github.com/ros/xacro.git -b ros2"
    "https://github.com/ros-controls/ros2_control.git"
    "https://github.com/PickNikRobotics/cpp_polyfills.git"
    "https://github.com/facontidavide/rosx_introspection.git"
    "https://github.com/foxglove/ros-foxglove-bridge.git"
    "https://github.com/ros-perception/vision_opencv.git"
    "https://github.com/christianrauch/camera_ros.git -b no_switch_error"
    "https://github.com/ros-perception/image_common.git -b jazzy"
    "https://github.com/ros2/message_filters.git -b jazzy"
)

for repo in "${repos[@]}"; do
    git clone $repo --recurse-submodules
done
EOF