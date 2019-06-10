basestrap -cGiM /mnt "linux419 grub amd-ucode intel-ucode
`#Base`
bash coreutils diffutils e2fsprogs filesystem findutils
grep iputils less man-db man-pages nano patch pciutils
sed shadow sudo systemd-sysvcompat tlp usbutils util-linux
`#Graphic and Audio`
mesa mesa-vdpau lib32-mesa lib32-mesa-vdpau
xorg-server xf86-video-ati
pulseaudio pulseaudio-alsa alsa-utils
`#manjaro`
manjaro-xfce-minimal-settings
pacman pamac-cli pamac-gtk
lightdm lightdm-gtk-greeter
networkmanager network-manager-applet
manjaro-settings-manager
`#xfce`
xfwm4 xfdesktop xfce4-panel xfce4-session
xfce4-settings xfce4-whiskermenu-plugin
xfce4-terminal xfce4-screenshooter
xdg-user-dirs thunar thunar-archive-plugin
mousepad qpdfview viewnior engrampa
gvfs gksu-polkit catfish
`#programs`
firefox htop vlc git
codeblocks hexchat streamlink"

manjaro-chroot /mnt "grub-install /dev/sda"
