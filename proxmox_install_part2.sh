#!/bin/bash

echo "======= installing Proxmox VE ======="
apt install --yes proxmox-ve postfix open-iscsi chrony
apt purge --yes linux-image-amd64 'linux-image-6.1*'
apt purge --yes os-prober
apt autoremove --yes --purge
reboot