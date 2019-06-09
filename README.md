nmtui

fdisk /dev/sda

mkfs.ext4 /dev/sda1

mkswap /dev/sda2

mount -o noatime /dev/sda1 /mnt

swapon /dev/sda2
