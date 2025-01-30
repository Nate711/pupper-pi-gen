#!/bin/bash -e

on_chroot << EOF
cd /home/$FIRST_USER_NAME/
git clone https://github.com/Nate711/pupperv3-monorepo.git --recurse-submodules
cd /home/$FIRST_USER_NAME/pupperv3-monorepo/
git lfs install
git lfs pull
EOF