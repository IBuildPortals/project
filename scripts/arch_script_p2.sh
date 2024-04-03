#!/usr/bin/sh

ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc
(echo en_US.UTF-8 UTF-8
echo en_US ISO-8859-1
echo da_DK.UTF-8 UTF-8
echo da_DK ISO-8859-1) > /etc/locale.gen
locale-gen
touch /etc/locale.conf
echo LANG=en_US.UTF-8 > /etc/locale.conf
touch /etc/vconsole.conf
echo KEYMAP=dk-latin1 > /etc/vconsole.conf
touch /etc/hostname
echo archlinux > /etc/hostname
pacman -Syu --noconfirm
pacman -S  iwd grub efibootmgr --noconfirm
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id="Arch Linux"
reboot
