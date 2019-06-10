sudo sed -i '/SigLevel/s/PackageRequired/PackageNever/' /etc/pacman.conf

basestrap -GM /mnt linux419 grub amd-ucode intel-ucode \
`#Base`\
bash coreutils diffutils e2fsprogs filesystem findutils \
grep iputils less man-db man-pages nano patch pciutils \
sed shadow sudo systemd-sysvcompat tlp usbutils util-linux \
`#Graphic and Audio`\
mesa mesa-vdpau lib32-mesa lib32-mesa-vdpau \
xorg-server xf86-video-ati \
pulseaudio pulseaudio-alsa alsa-utils \
`#manjaro`\
manjaro-xfce-minimal-settings ttf-dejavu \
pacman pamac-cli pamac-gtk \
lightdm lightdm-gtk-greeter \
networkmanager network-manager-applet \
manjaro-settings-manager \
`#xfce`\
xfwm4 xfdesktop xfce4-panel xfce4-session \
xfce4-settings xfce4-whiskermenu-plugin \
xfce4-terminal xfce4-screenshooter \
xdg-user-dirs thunar thunar-archive-plugin \
mousepad qpdfview viewnior engrampa \
gvfs gksu-polkit catfish \
`#programs`\
firefox htop vlc git \
codeblocks hexchat streamlink \
--confirm

#Install grub
manjaro-chroot /mnt "grub-install /dev/sda"
#Generate fstab
fstabgen -U /mnt | sudo tee /mnt/etc/fstab
#Set hostname
echo "EasyNoteMZ35" | sudo tee /mnt/etc/hostname
#Set locale
echo "LANG=pl_PL.UTF-8" | sudo tee /mnt/etc/locale.conf
#Set timezone
manjaro-chroot /mnt "ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime"
#Add new user
manjaro-chroot /mnt "useradd kacper -m -G wheel,storage,power,network,video,audio,lp,sys,input"
#Set password for new user
manjaro-chroot /mnt "passwd kacper"
#Set sudoers
sudo sed -i '/%wheel ALL=(ALL) ALL/s/# //' /mnt/etc/sudoers
#Enable lightdm
manjaro-chroot /mnt "systemctl enable display-manager"
