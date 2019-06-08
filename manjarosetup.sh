pacman -r /mnt -Sy linux419 grub amd-ucode intel-ucode \
bash coreutils nano sudo less grep \
pacman pamac-cli pamac-gtk pamac-tray-appindicator \
lightdm networkmanager network-manager-applet pulseaudio pulseaudio-alsa \
htop xfce4-terminal \
firefox thunar mousepad \
codeblocks

#fstabgen -U /mnt > /mnt/etc/fstab
#echo "EasyNoteMZ35" > /mnt/etc/hostname
#ln -sf /mnt/usr/share/zoneinfo/Europe/Warsaw /mnt/etc/localtime
manjaro-chroot "grub-install"
cp -a /mnt/etc/skel/. /mnt/home/kacper/
