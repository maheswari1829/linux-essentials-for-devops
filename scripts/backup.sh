#!/bin/bash
# Backup home directory to /tmp/backup.tar.gz

BACKUP_FILE="/tmp/home-backup-$(date +%F).tar.gz"
tar -czvf $BACKUP_FILE /home/$USER
echo "Backup saved to $BACKUP_FILE"
