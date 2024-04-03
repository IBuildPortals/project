#!/usr/bin/sh

( echo g
echo n
echo 1
echo
echo +1G
echo n
echo 2
echo
echo +8G
echo n
echo 3
echo
echo
echo w ) | fdisk /dev/nvme0n1

mkfs.fat -F 32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p3
mount /dev/nvme0n1p3 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
swapon /dev/nvme0n1p2

pacstrap -K /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
