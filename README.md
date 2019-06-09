nmtui-connect

fdisk /dev/sda

mkfs.ext4 /dev/sda1

mkswap /dev/sda2

mount -o noatime /dev/sda1 /mnt

swapon /dev/sda2

wget --no-hsts https://raw.githubusercontent.com/vfjpl/manjaro/master/manjarosetup.sh

chmod +x manjarosetup.sh

./manjarosetup.sh
