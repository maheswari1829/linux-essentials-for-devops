# 🐧 Linux Installation Guide for DevOps & Cloud Engineers

## 1. Recommended Linux Distros
- **Ubuntu Server (20.04/22.04 LTS)** → widely used for DevOps tools
- **CentOS Stream / Rocky Linux** → enterprise environments
- **Amazon Linux 2** → AWS cloud workloads

## 2. How to Install (VirtualBox/VMware)
1. Download ISO from [Ubuntu Downloads](https://ubuntu.com/download/server).
2. Create new VM in VirtualBox → select ISO as boot disk.
3. Allocate:
   - CPU: 2+
   - RAM: 4 GB
   - Disk: 20 GB+
4. Follow on-screen instructions to install.

## 3. Post-Installation Setup
```bash
# Update packages
sudo apt update && sudo apt upgrade -y

# Install basic tools
sudo apt install -y curl wget git unzip htop net-tools vim tree
