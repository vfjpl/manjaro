sudo pacman-mirrors -c Poland
sudo pacman -Sy --noconfirm arch-install-scripts


sudo pacstrap -ic /mnt \
grub update-grub amd-ucode intel-ucode \
linux-meta linux-firmware \
base nano openssh tlp usbutils xssstate \
networkmanager network-manager-applet \
pulseaudio pulseaudio-alsa alsa-utils \
mesa lib32-mesa \
mesa-vdpau lib32-mesa-vdpau \
vulkan-radeon lib32-vulkan-radeon \
mesa-utils vulkan-tools \
xorg-server xf86-video-ati \
lightdm lightdm-gtk-greeter \
manjaro-xfce-minimal-settings \
xfwm4 xfconf xfdesktop \
xfce4-session xfce4-panel xfce4-whiskermenu-plugin \
xfce4-settings xfce4-terminal xfce4-screenshooter \
thunar thunar-archive-plugin thunar-media-tags-plugin \
mousepad viewnior engrampa \
xfce4-pulseaudio-plugin pavucontrol \
xdg-user-dirs gvfs \
firefox firefox-i18n-pl hunspell-pl hunspell-en_US \
codeblocks mpv htop \
steam-native-runtime \
base-devel cmake git \
sfml poco boost lua51 physfs


genfstab -U /mnt | sudo tee -a /mnt/etc/fstab
echo "LANG=pl_PL.UTF-8" | sudo tee /mnt/etc/locale.conf
echo "KEYMAP=pl" | sudo tee /mnt/etc/vconsole.conf

sudo sed -i '/pl_PL.UTF-8/s/#//' /mnt/etc/locale.gen
sudo sed -i '/%wheel ALL=(ALL:ALL) ALL/s/# //' /mnt/etc/sudoers
sudo sed -i '/Inherits/s/Adwaita//' /mnt/usr/share/icons/default/index.theme
sudo sed -i '/CursorThemeName/s/xcursor-breeze//' /mnt/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
sudo sed -i '/DISK_DEVICES/s/nvme0n1 sda/sda sdb/' /mnt/etc/tlp.conf
sudo sed -i '/DISK_IOSCHED/s/mq-deadline mq-deadline/bfq bfq/' /mnt/etc/tlp.conf
sudo sed -i '/DISK_DEVICES/s/#//' /mnt/etc/tlp.conf
sudo sed -i '/DISK_IOSCHED/s/#//' /mnt/etc/tlp.conf
sudo sed -i '/GRUB_TIMEOUT/s/5/1/' /mnt/etc/default/grub
sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/s/udev.log_priority=3/i8042.direct/' /mnt/etc/default/grub

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

echo "set-card-profile alsa_card.pci-0000_06_00.4 output:analog-stereo+input:analog-stereo
set-sink-port alsa_output.pci-0000_06_00.4.analog-stereo analog-output-lineout" | sudo tee /mnt/etc/pulse/default.pa.d/card-profile-sink-port.pa


sudo arch-chroot /mnt ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
sudo arch-chroot /mnt locale-gen
sudo arch-chroot /mnt grub-install --target=i386-pc /dev/sda
sudo arch-chroot /mnt update-grub
sudo arch-chroot /mnt useradd cosiek -m -G wheel,storage,input,video,audio,power,optical,network,lp,scanner,sys
sudo arch-chroot /mnt useradd vfjpl -m -G wheel,storage,input,video,audio,power,optical,network,lp,scanner,sys
sudo arch-chroot /mnt systemctl enable tlp lightdm NetworkManager


echo "Password cosiek:"
sudo arch-chroot /mnt passwd cosiek
echo "Password vfjpl:"
sudo arch-chroot /mnt passwd vfjpl
