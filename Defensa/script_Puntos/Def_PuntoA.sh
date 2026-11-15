#!/bin/bash

#particion

sudo fdisk /dev/sdd <<EOF
n
p
1

+512M
n
e



n


t
1
82
w
EOF

sudo partprobe /dev/sdd

#Muestro las particiones:
sudo fdisk -l /dev/sdd

echo
read -p "presione enter"
echo

#formateo

sudo mkswap /dev/sdd1
sudo mkfs.ext4 /dev/sdd5

echo
read -p "presione enter"
echo


#montaje
sudo mkdir -p /P_Defensa

cat << EOF | sudo tee -a /etc/fstab

/dev/sdd5 /P_Defensa    ext4    defaults            0   0
EOF

sudo mount -a

sudo swapon /dev/sdd1


