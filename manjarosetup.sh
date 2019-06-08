pacman -Sy pacman grub coreutils

pacman -r /mnt -Sy linux419 grub amd-ucode intel-ucode \
xf86-video-ati mesa-vdpau lib32-mesa-vdpau xorg-server \
bash coreutils nano sudo less grep \
pacman pamac-cli pamac-gtk pamac-tray-appindicator \
lightdm networkmanager network-manager-applet pulseaudio pulseaudio-alsa \
xfce4-terminal xfce4-whiskermenu-plugin \
thunar mousepad  \
firefox htop \
codeblocks

#fstabgen -U /mnt > /mnt/etc/fstab
#echo "EasyNoteMZ35" > /mnt/etc/hostname
#ln -sf /mnt/usr/share/zoneinfo/Europe/Warsaw /mnt/etc/localtime
grub-install --boot-directory=/mnt/boot /dev/sda
cp -a /mnt/etc/skel/. /mnt/home/kacper/
