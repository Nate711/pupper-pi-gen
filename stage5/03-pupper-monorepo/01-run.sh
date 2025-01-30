#!/bin/bash -e

on_chroot << EOF
cd /home/$FIRST_USER_NAME/

# Clone or update the monorepo
if [ -d "/home/$FIRST_USER_NAME/pupperv3-monorepo/" ]; then
    cd /home/$FIRST_USER_NAME/pupperv3-monorepo/
    git pull
    git submodule update --init --recursive
else
    git clone https://github.com/Nate711/pupperv3-monorepo.git --recurse-submodules
    cd /home/$FIRST_USER_NAME/pupperv3-monorepo/
fi
git lfs install
git lfs pull
EOF