pacman -r /mnt -Sy linux419 grub amd-ucode intel-ucode \
#Base
bash coreutils diffutils e2fsprogs filesystem findutils \
grep iputils less man-db man-pages nano pciutils shadow \
sudo usbutils util-linux \
#Graphic and Audio
mesa mesa-vdpau lib32-mesa lib32-mesa-vdpau \
xorg-server xorg-xinit \
pulseaudio pulseaudio-alsa alsa-utils \
#manjaro
manjaro-system manjaro-xfce-minimal-settings \
pacman pamac-cli pamac-gtk \
lightdm networkmanager network-manager-applet \
manjaro-settings-manager \
#xfce
xfwm4 xfdesktop xfce4-settings xfce4-panel xfce4-whiskermenu-plugin \
xfce4-terminal xfce4-screenshooter \
thunar mousepad ristretto qpdfview \
#programs
firefox htop vlc git \
codeblocks hexchat

manjaro-chroot /mnt "grub-install /dev/sda"
#grub-install --boot-directory=/mnt/boot /dev/sda
#fstabgen -U /mnt > /mnt/etc/fstab
#echo "EasyNoteMZ35" > /mnt/etc/hostname
#ln -sf /mnt/usr/share/zoneinfo/Europe/Warsaw /mnt/etc/localtime
#cp -a /mnt/etc/skel/. /mnt/home/kacper/
