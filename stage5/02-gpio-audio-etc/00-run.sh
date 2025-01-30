#!/bin/bash -e

on_chroot << EOF
pip install Adafruit-Blinka RPi.GPIO --break-system-packages
EOF