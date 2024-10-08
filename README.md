0. usuń MBR(partycje) z dysku

`sudo dd if=/dev/zero of=/dev/sda count=4096`

1. połącz się z internetem

`nmtui-connect`

2. stwórz partycje: podstawowa 1 na system typ/id 83(domyślnie), podstawowa 2 na swap typ/id 82

`sudo fdisk /dev/sda`

3. stwórz system plików ext4 na pierwszej partycji

`sudo mkfs.ext4 /dev/sda1`
`sudo mkfs.ext4 /dev/sdb1`

4. stwórz swap na drugiej partycji

`sudo mkswap /dev/sda2`

5. zamontuj pierwszą partycję

`sudo mount -o noatime /dev/sda1 /mnt`
`sudo mount -o noatime --mkdir /dev/sdb1 /mnt/home`

6. zamontuj partycję swap

`sudo swapon /dev/sda2`

7. ściągnij skrypt instalacyjny

`wget --no-hsts https://git.io/fjgsm`

8. nadaj prawo uruchamiania skryptowi instalacyjnemu

`chmod +x fjgsm`

9. odpal skrypt instalacyjny systemu Manjaro

`./fjgsm`

10. uruchom ponownie komputer i wyjmij live cd

`reboot`
