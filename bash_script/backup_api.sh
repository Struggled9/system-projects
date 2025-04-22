#!/bin/bash

# Directories and files
BACKUP_DIR="/home/ubuntu/backups"  # Path where backups will be 
API_DIR="/home/ubuntu/Struggled9"
DB_NAME="assignment"
DB_USER="root"  # Adjust as necessary
DB_PASS=""  # Add your password securely
LOG_FILE="/var/log/backup.log"
DATE=$(date +%F)

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Define backup filenames
API_BACKUP="$BACKUP_DIR/api_backup_${DATE}.tar.gz"
DB_BACKUP="$BACKUP_DIR/db_backup_${DATE}.sql"

# Start backup process
echo "[$(date '+%Y-%m-%d %H:%M:%S')] 🔄 Starting backup..." >> "$LOG_FILE"

# Backup the API directory
if tar -czf "$API_BACKUP" "$API_DIR"; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')]  API backup successful: $API_BACKUP" >> "$LOG_FILE"
else
  echo "[$(date '+%Y-%m-%d %H:%M:%S')]  API backup failed!" >> "$LOG_FILE"
fi

# Delete backups older than 7 days
find "$BACKUP_DIR" -type f -mtime +7 -exec rm -f {} \;

# Log completion of the backup
echo "[$(date '+%Y-%m-%d %H:%M:%S')] ✅ Backup process completed." >> "$LOG_FILE"

