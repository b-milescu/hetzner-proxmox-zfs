#!/bin/bash

echo "======= adding Proxmox repos & install kernel ======="
echo 'deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription' > /etc/apt/sources.list.d/pve-install-repo.list
echo '# deb https://enterprise.proxmox.com/debian/pve bookworm InRelease' > /etc/apt/sources.list.d/pve-enterprise.list
wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg
apt update && apt full-upgrade --yes
apt install --yes proxmox-default-kernel
reboot
