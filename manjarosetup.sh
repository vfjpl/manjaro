sudo sed -i '/SigLevel/s/PackageRequired/PackageNever/' /etc/pacman.conf
sudo pacman-mirrors -c Poland

basestrap -GiM /mnt \
`#Kernel`\
linux-latest grub amd-ucode intel-ucode \
`#Base`\
bash coreutils e2fsprogs filesystem gawk grep iproute2 iputils \
less man-db man-pages nano pciutils procps-ng psmisc \
sed shadow usbutils util-linux openssh \
sudo systemd systemd-sysvcompat tlp xssstate \
patch diffutils findutils \
`#Dev`\
gcc gdb git pkgconf make cmake fakeroot \
`#Graphic and Audio`\
mesa mesa-vdpau lib32-mesa lib32-mesa-vdpau \
mesa-demos \
xorg-server xf86-video-ati \
pulseaudio pulseaudio-alsa alsa-utils \
`#manjaro`\
manjaro-xfce-minimal-settings ttf-dejavu \
pacman pamac-cli pamac-gtk \
lightdm lightdm-gtk-greeter \
networkmanager network-manager-applet \
manjaro-settings-manager \
`#xfce`\
xfwm4 xfconf xfdesktop \
xfce4-session xfce4-panel xfce4-whiskermenu-plugin \
xfce4-settings xfce4-terminal \
xfce4-screenshooter xfburn \
thunar thunar-archive-plugin thunar-media-tags-plugin \
mousepad qpdfview viewnior engrampa \
xdg-user-dirs gvfs catfish \
`#programs`\
firefox firefox-i18n-pl hunspell-pl hunspell-en_US \
codeblocks mpv ffmpeg streamlink htop \
`#libs`\
sfml poco boost lua51 physfs

#generate fstab and install grub
fstabgen -U /mnt | sudo tee -a /mnt/etc/fstab
sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/s/udev.log_priority=3/i8042.direct mitigations=off/' /mnt/etc/default/grub
manjaro-chroot /mnt "grub-install /dev/sda"
manjaro-chroot /mnt "update-grub"

#settings
sudo sed -i '/pl_PL.UTF-8/s/#//' /mnt/etc/locale.gen
echo "LANG=pl_PL.UTF-8" | sudo tee /mnt/etc/locale.conf
echo "KEYMAP=pl" | sudo tee /mnt/etc/vconsole.conf
echo "kernel.sysrq = 1" | sudo tee /mnt/etc/sysctl.d/99-sysctl.conf
echo "Section \"InputClass\"
	Identifier \"system-keyboard\"
	MatchIsKeyboard \"yes\"
	Option \"XkbLayout\" \"pl\"
EndSection" | sudo tee /mnt/etc/X11/xorg.conf.d/00-keyboard.conf
echo "Section \"InputClass\"
	Identifier \"system-mouse\"
	Driver \"libinput\"
	MatchIsPointer \"yes\"
	Option \"AccelProfile\" \"flat\"
EndSection" | sudo tee /mnt/etc/X11/xorg.conf.d/50-mouse.conf
sudo sed -i '/%wheel ALL=(ALL) ALL/s/# //' /mnt/etc/sudoers
sudo sed -i '/Inherits/s/Adwaita//' /mnt/usr/share/icons/default/index.theme

#init
manjaro-chroot /mnt "ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime"
manjaro-chroot /mnt "locale-gen"
manjaro-chroot /mnt "systemctl enable lightdm NetworkManager systemd-timesyncd"
manjaro-chroot /mnt "pacman-key --init"
manjaro-chroot /mnt "pacman-key --populate"
manjaro-chroot /mnt "pacman-mirrors -c Poland"

#manual
echo "Nazwa komputera:"
read hostname
echo $hostname | sudo tee /mnt/etc/hostname
echo "Nazwa uzytkownika:"
read username
manjaro-chroot /mnt "useradd $username -m -G wheel,storage,input,video,audio,power,optical,network,lp,scanner,sys"
echo "Haslo:"
manjaro-chroot /mnt "passwd $username"
