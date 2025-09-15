#!/bin/bash
# setup-cron.sh
# This script will schedule a daily backup job at 2 AM
# It assumes backup.sh is already present in scripts/ directory

BACKUP_SCRIPT="$(pwd)/scripts/backup.sh"

if [ ! -f "$BACKUP_SCRIPT" ]; then
  echo "❌ Backup script not found at $BACKUP_SCRIPT"
  exit 1
fi

# Add cron job (2 AM daily)
CRON_JOB="0 2 * * * bash $BACKUP_SCRIPT"

# Check if already exists
(crontab -l 2>/dev/null | grep -F "$BACKUP_SCRIPT") && {
  echo "✅ Cron job already exists"
} || {
  (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
  echo "✅ Cron job added: runs daily at 2 AM"
}

# Show current cron jobs
echo "📋 Current cron jobs:"
crontab -l
