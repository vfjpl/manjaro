sudo sed -i '/SigLevel/s/PackageRequired/PackageNever/' /etc/pacman.conf
sudo pacman-mirrors -c Poland

basestrap -GiM /mnt linux419 grub amd-ucode intel-ucode \
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
firefox firefox-i18n-pl hunspell-pl \
codeblocks sfml htop git \
vlc streamlink hexchat


#generate fstab and install grub
fstabgen -U /mnt | sudo tee -a /mnt/etc/fstab
sudo sed -i 's/,pri=-2/       /' /mnt/etc/fstab
manjaro-chroot /mnt "grub-install /dev/sda"

#set hostname and timezone
echo "EasyNoteMZ35" | sudo tee /mnt/etc/hostname
manjaro-chroot /mnt "ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime"

#set locale
sudo sed -i '/pl_PL.UTF-8/s/#//' /mnt/etc/locale.gen
echo "LANG=pl_PL.UTF-8" | sudo tee /mnt/etc/locale.conf
echo "KEYMAP=pl" | sudo tee /mnt/etc/vconsole.conf
echo "Section \"InputClass\"
        Identifier \"system-keyboard\"
        MatchIsKeyboard \"on\"
        Option \"XkbLayout\" \"pl\"
EndSection" | sudo tee /mnt/etc/X11/xorg.conf.d/00-keyboard.conf
manjaro-chroot /mnt "locale-gen"

#settings
sudo sed -i '/%wheel ALL=(ALL) ALL/s/# //' /mnt/etc/sudoers
sudo sed -i '/Inherits/s/Adwaita//' /mnt/usr/share/icons/default/index.theme
sudo sed -i 's/#autologin-user=/autologin-user=kacper/' /mnt/etc/lightdm/lightdm.conf
sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/s/quiet/quiet i8042.direct/' /mnt/etc/default/grub
manjaro-chroot /mnt "systemctl enable lightdm NetworkManager systemd-timesyncd"
manjaro-chroot /mnt "pacman-key --init"
manjaro-chroot /mnt "pacman-key --populate"
manjaro-chroot /mnt "pacman-mirrors -c Poland"
sudo nano /mnt/usr/share/pulseaudio/alsa-mixer/profile-sets/default.conf

echo 'ACTION=="add|change", KERNEL=="sr[0-9]", ATTR{queue/scheduler}="none"
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"' | sudo tee /etc/udev/rules.d/60-ioscheduler.rules


#add new user
manjaro-chroot /mnt "useradd kacper -m -G wheel,storage,input,video,audio,power,optical,network,lp,scanner,sys"
manjaro-chroot /mnt "passwd kacper"
