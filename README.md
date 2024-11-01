
# Proxmox VE on an Encrypted ZFS Pool with Hetzner VPS

## Overview
This repository contains two scripts:
1. **hetzner-debian12-zfs-setup.sh**: Installs Debian 12 with ZFS as the root file system on a Hetzner VPS.
2. **proxmox_install.sh**: Installs Proxmox Virtual Environment (VE) on Debian 12.

## Usage

### 1. Hetzner Debian 12 with ZFS Setup
**Script:** `hetzner-debian12-zfs-setup.sh`  
**Description:** This script automates the setup of Debian 12 with ZFS root on Hetzner VPS. It prepares ZFS pools, partitions disks, and installs Debian 12 on the root ZFS filesystem.

#### Steps to Use:
1. In the Hetzner rescue system:
   - Set the OS to `Linux`.
   - Add your SSH key.
   - Click "Activate rescue system"
2. SSH into the console after reboot and run the script:
   ```bash
   bash -c "$(curl -fsSL https://raw.githubusercontent.com/b-milescu/ai-ops/refs/heads/main/hetzner-debian12-zfs-setup.sh)"
   ```
3. Follow prompts to configure:
   - Hostname
   - ZFS ARC cache size
   - Disk selections for ZFS pools
   - Swap size and free tail space
   - Root password
   - Encryption options for the root pool

**Note:** Run the script in a `screen` session to prevent disconnections:
   ```bash
   screen -dmS zfs
   screen -r zfs
   ```

### 2. Proxmox VE Install on Debian 12
**Scripts:** `proxmox_install_part1.sh` and `proxmox_install_part2.sh`
**Description:** The will install installs Proxmox VE on Debian 12, adding Proxmox repositories, installing necessary packages, and configuring the environment.

#### Steps to Use:
1. SSH into your Debian 12 server.
2. Run the first script:
   ```bash
   bash -c "$(curl -fsSL https://raw.githubusercontent.com/b-milescu/ai-ops/refs/heads/main/proxmox_install_part1.sh)"
   ```
   After reboot run the second script:
   ```bash
   bash -c "$(curl -fsSL https://raw.githubusercontent.com/b-milescu/ai-ops/refs/heads/main/proxmox_install_part2.sh)"
   ```
3. The scripts will:
   - Add Proxmox repository and update the system.
   - Install the Proxmox kernel and required packages (Proxmox VE, Postfix, Open-iSCSI, and Chrony).
   - Reboot automatically after major installation steps.

## Warnings
- **Data Loss:** Running `hetzner-debian12-zfs-setup.sh` will erase all data on the selected disk.
- **Internet Connection:** Both scripts require an active internet connection to download packages.
