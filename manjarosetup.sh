pacman -r /mnt -Sy linux419 grub amd-ucode intel-ucode \
coreutils iputils findutils diffutils pciutils usbutils \
bash util-linux e2fsprogs less grep \
sudo nano man-db man-pages \
mesa mesa-vdpau lib32-mesa lib32-mesa-vdpau xorg-server \
pulseaudio pulseaudio-alsa alsa-utils \
pacman pamac-cli pamac-gtk \
lightdm networkmanager network-manager-applet \
manjaro-xfce-minimal-settings manjaro-settings-manager \
xfwm4 xfdesktop xfce4-settings xfce4-panel xfce4-whiskermenu-plugin \
xfce4-terminal  xfce4-screenshooter \
thunar mousepad ristretto \
firefox htop \
codeblocks vlc git

#grub-install --boot-directory=/mnt/boot /dev/sda
#fstabgen -U /mnt > /mnt/etc/fstab
#echo "EasyNoteMZ35" > /mnt/etc/hostname
#ln -sf /mnt/usr/share/zoneinfo/Europe/Warsaw /mnt/etc/localtime
#cp -a /mnt/etc/skel/. /mnt/home/kacper/
