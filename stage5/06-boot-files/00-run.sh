#!/bin/bash -e

CONFIG_TXT="${ROOTFS_DIR}/boot/firmware/config.txt"
sed -i '1idtparam=spi=on' $CONFIG_TXT
sed -i '1idtparam=i2c_arm=on,i2c_arm_baudrate=100000' $CONFIG_TXT
echo 'usb_max_current_enable=1' >> $CONFIG_TXT
echo 'gpu_mem=128' >> $CONFIG_TXT
echo 'dtoverlay=hifiberry-dac' >> $CONFIG_TXT
