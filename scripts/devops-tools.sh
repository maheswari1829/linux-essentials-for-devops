#!/bin/bash
# ===============================================
# DevOps Linux Automation Toolkit
# Contains: user setup, backup, monitoring,
# cron job setup, firewall configuration
# ===============================================

# -------------------------------
# 1. User Setup Script
# -------------------------------
create_user() {
  if [ -z "$1" ]; then
    echo "Usage: create_user <username>"
    return 1
  fi
  USER=$1
  sudo adduser $USER
  sudo usermod -aG sudo $USER
  echo "✅ User $USER created and added to sudo group."
}

# -------------------------------
# 2. Backup Script
# -------------------------------
backup_home() {
  BACKUP_FILE="/tmp/home-backup-$(date +%F).tar.gz"
  tar -czvf $BACKUP_FILE /home/$USER
  echo "✅ Backup saved to $BACKUP_FILE"
}

# -------------------------------
# 3. Monitoring Script
# -------------------------------
monitor_system() {
  echo "===== System Monitoring Report ====="
  echo "📅 Date: $(date)"
  echo
  echo "💻 CPU Load:"
  uptime
  echo
  echo "🧠 Memory Usage:"
  free -h
  echo
  echo "💾 Disk Usage:"
  df -h
  echo "===================================="
}

# -------------------------------
# 4. Cron Setup (Runs backup daily at 2 AM)
# -------------------------------
setup_cron() {
  BACKUP_SCRIPT="$(pwd)/scripts/devops-tools.sh backup_home"
  CRON_JOB="0 2 * * * bash $BACKUP_SCRIPT"

  # Check if cron job already exists
  (crontab -l 2>/dev/null | grep -F "$BACKUP_SCRIPT") && {
    echo "✅ Cron job already exists"
  } || {
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "✅ Cron job added: runs backup daily at 2 AM"
  }

  echo "📋 Current cron jobs:"
  crontab -l
}

# -------------------------------
# 5. Firewall Setup
# -------------------------------
setup_firewall() {
  echo "⚙️ Configuring firewall..."
  if command -v ufw &>/dev/null; then
    sudo ufw allow 22/tcp
    sudo ufw allow 80/tcp
    sudo ufw --force enable
    echo "✅ UFW configured (allowed SSH + HTTP)"
  elif command -v firewall-cmd &>/dev/null; then
    sudo systemctl start firewalld
    sudo firewall-cmd --permanent --add-port=22/tcp
    sudo firewall-cmd --permanent --add-port=80/tcp
    sudo firewall-cmd --reload
    echo "✅ Firewalld configured (allowed SSH + HTTP)"
  else
    echo "❌ No supported firewall tool found (install ufw or firewalld)"
  fi
}

# -------------------------------
# Main: Run function by argument
# -------------------------------
case "$1" in
  create_user) create_user $2 ;;
  backup_home) backup_home ;;
  monitor_system) monitor_system ;;
  setup_cron) setup_cron ;;
  setup_firewall) setup_firewall ;;
  *)
    echo "Usage: $0 {create_user <username>|backup_home|monitor_system|setup_cron|setup_firewall}"
    ;;
esac
