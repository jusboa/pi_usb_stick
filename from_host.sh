#!/bin/bash

MOUNT_POINT=/mnt/mass_storage
BACKING_STORAGE=/home/pi/backing-store

umount --quiet --detach-loop ${MOUNT_POINT}

sudo modprobe g_mass_storage file=${BACKING_STORAGE}
