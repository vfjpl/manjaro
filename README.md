nmtui-connect

sudo fdisk /dev/sda

sudo mkfs.ext4 /dev/sda1

sudo mkswap /dev/sda2

sudo mount -o noatime /dev/sda1 /mnt

sudo swapon /dev/sda2

wget --no-hsts https://git.io/fjgsm

chmod +x fjgsm

./fjgsm

reboot
