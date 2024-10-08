sudo pacman-mirrors -c Poland
sudo pacman -Sy --noconfirm arch-install-scripts

sudo pacstrap -Kic /mnt \
grub update-grub amd-ucode intel-ucode \
linux linux-firmware \
base nano usbutils xssstate \
base-devel cmake git \
mesa lib32-mesa \
mesa-vdpau lib32-mesa-vdpau \
mesa-demos \
xorg-server xf86-video-ati \
pulseaudio pulseaudio-alsa alsa-utils \
networkmanager network-manager-applet \
firefox firefox-i18n-pl hunspell-pl hunspell-en_US \
codeblocks

genfstab -U /mnt | sudo tee -a /mnt/etc/fstab
sudo sed -i '/pl_PL.UTF-8/s/#//' /mnt/etc/locale.gen
echo "LANG=pl_PL.UTF-8" | sudo tee /mnt/etc/locale.conf
echo "KEYMAP=pl" | sudo tee /mnt/etc/vconsole.conf
sudo sed -i '/%wheel ALL=(ALL) ALL/s/#//' /mnt/etc/sudoers

arch-chroot /mnt "ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime"
arch-chroot /mnt "locale-gen"
arch-chroot /mnt "grub-install --target=i386-pc /dev/sda"
arch-chroot /mnt "update-grub"
arch-chroot /mnt "useradd cosiek -m -G wheel,storage,input,video,audio,power,optical,network,lp,scanner,sys"
arch-chroot /mnt "useradd vfjpl -m -G wheel,storage,input,video,audio,power,optical,network,lp,scanner,sys"

echo "Haslo cosiek:"
arch-chroot /mnt "passwd cosiek"
echo "haslo vfjpl:"
arch-chroot /mnt "passwd vfjpl"
