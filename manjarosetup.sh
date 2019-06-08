pacman -Sy pacman grub coreutils

pacman -r /mnt -Sy linux419 grub amd-ucode intel-ucode \
mesa mesa-vdpau lib32-mesa lib32-mesa-vdpau xorg-server \
pulseaudio pulseaudio-alsa \
bash coreutils nano sudo less grep \
pacman pamac-cli pamac-gtk \
lightdm networkmanager network-manager-applet \
manjaro-xfce-minimal-settings \
xfce4-terminal xfce4-whiskermenu-plugin \
thunar mousepad  \
firefox htop \
codeblocks vlc

#fstabgen -U /mnt > /mnt/etc/fstab
#echo "EasyNoteMZ35" > /mnt/etc/hostname
#ln -sf /mnt/usr/share/zoneinfo/Europe/Warsaw /mnt/etc/localtime
grub-install --boot-directory=/mnt/boot /dev/sda
cp -a /mnt/etc/skel/. /mnt/home/kacper/
