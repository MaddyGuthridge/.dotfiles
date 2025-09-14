#!/usr/bin/env bash
# https://gist.github.com/andrebrait/961cefe730f4a2c41f57911e6195e444
# Enable function keys
echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
# And persist those changes
echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
