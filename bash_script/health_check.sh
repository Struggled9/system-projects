#!/bin/bash

LOG_FILE="/var/log/health_check.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Collecting system resource usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USAGE=$(free | awk '/Mem/{printf("%.2f"), $3/$2 * 100}')
DISK_USAGE=$(df / | awk 'END{print $5}' | sed 's/%//')

# Determine which web server is running
WEB_SERVER=""
if systemctl is-active --quiet nginx; then
  WEB_SERVER="nginx"
elif systemctl is-active --quiet apache2; then
  WEB_SERVER="apache2"
fi

WEB_STATUS=$(systemctl is-active $WEB_SERVER 2>/dev/null)

# Check API statuses
API_1_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://51.20.12.42:5001/students)
API_2_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://51.20.12.42:5001/subjects)

{
  echo "[$TIMESTAMP] CPU: $CPU_USAGE% | MEM: $MEM_USAGE% | DISK: $DISK_USAGE% | Web Server: $WEB_SERVER ($WEB_STATUS) | /students: $API_1_STATUS | /subjects: $API_2_STATUS"

  if [ "$DISK_USAGE" -gt 90 ]; then
    echo "[$TIMESTAMP] WARNING: Disk space critically low (${DISK_USAGE}%)"
  fi

  if [ "$WEB_STATUS" != "active" ]; then
    echo "[$TIMESTAMP] WARNING: Web server ($WEB_SERVER) is not running"
  fi

  if [ "$API_1_STATUS" -ne 200 ]; then
    echo "[$TIMESTAMP] WARNING: /students API not responding correctly"
  fi

  if [ "$API_2_STATUS" -ne 200 ]; then
    echo "[$TIMESTAMP] WARNING: /subjects API not responding correctly"
    fi
} >> "$LOG_FILE"



