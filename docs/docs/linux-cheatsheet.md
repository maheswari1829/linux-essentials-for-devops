
```markdown
# ⚡ Linux Daily Commands Cheatsheet (DevOps & Cloud)

## 🔹 System Info
```bash
uname -a         # Kernel & system info
lsb_release -a   # Linux distro info
uptime           # How long system has been running
hostname -I      # IP address
whoami           # Current user
## 🔹 User & Permissions
id               # Show user id
adduser devops   # Add new user
passwd devops    # Change password
usermod -aG sudo devops   # Add user to sudo
chmod 755 file   # Change permissions
chown user:group file  # Change ownership
## 🔹 File & Directory
ls -lah          # List with details
cd /path         # Change directory
pwd              # Show current dir
find / -name file.txt   # Search file
tree             # Directory tree
du -sh *         # Disk usage by file/folder
## 🔹 Networking
ping google.com
curl -I http://example.com
wget https://file.com/file.zip
netstat -tulnp   # Open ports
ss -tulnp        # Alternative to netstat
## 🔹 Processes
ps aux | grep nginx
top              # Live processes
htop             # Interactive process monitor
kill -9 <pid>
## 🔹 Packages
apt update && apt upgrade -y
apt install nginx -y
systemctl status nginx
systemctl enable --now nginx
## 🔹 Logs
tail -f /var/log/syslog
journalctl -xe
dmesg | less
## 🔹 Disk & Storage
df -h            # Disk usage
lsblk            # List block devices
mount /dev/sdb1 /mnt
