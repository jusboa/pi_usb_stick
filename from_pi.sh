#!/bin/bash

LOOP_DEVICE=/dev/loop0
BACKING_STORAGE=/home/pi/backing-store
MOUNT_POINT=/mnt/mass_storage

if [ $(pwd) == ${MOUNT_POINT} ]; then
    cd ..
fi

umount --quiet --detach-loop ${MOUNT_POINT}

modprobe -r g_mass_storage

SECTOR_SIZE_BYTES=$(fdisk -lu ${BACKING_STORAGE} | sed -n -r "s/Units: sectors.*= ([0-9]+) bytes/\1/p")
STARTING_SECTOR=$(fdisk -lo Start ${BACKING_STORAGE} | sed -n -r "s/^ ([0-9]+)$/\1/p")
OFFSET=$((${SECTOR_SIZE_BYTES} * ${STARTING_SECTOR}))

losetup -o ${OFFSET} ${LOOP_DEVICE} ${BACKING_STORAGE}
mount -t vfat ${LOOP_DEVICE} ${MOUNT_POINT} -o uid=pi -o gid=pi


