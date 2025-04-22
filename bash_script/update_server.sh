#!/bin/bash

LOG_FILE="/var/log/update_server.log"
REPO_DIR="/home/ubuntu/Struggled9"
GIT_REPO_URL="https://github.com/Struggled9/system-projects.git"
WEB_SERVICE="nginx"

{
  echo "[$(date '+%Y-%m-%d %H:%M:%S')]  Starting server update..."

  apt update && apt upgrade -y

  cd "$REPO_DIR" || {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')]  ERROR: Failed to access $REPO_DIR"
    exit 1
  }

  if git pull origin main; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')]  Git pull successful"
    systemctl restart "$WEB_SERVICE"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')]  Web server restarted"
  else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')]  Git pull failed! Update aborted."
    exit 1
  fi

} >> "$LOG_FILE" 2>&1
