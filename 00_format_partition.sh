#!/bin/bash
set -eu

# Import some helpful functions, prefixed 'L_'
. ./Library.sh

USB_DEVICE=$1

L_banner_begin "FORMAT PARTITION"
if [[ $( L_mnt_detect "$USB_DEVICE" ) ]]; then
    L_mnt_umount "$USB_DEVICE"
fi
sudo mkfs.vfat -n MULTIBOOT /dev/"$USB_DEVICE"
echo "Create vfat filesystem on $USB_DEVICE"
L_sig_ok
L_banner_end "FORMAT PARTITION"
