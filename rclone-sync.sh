#!/bin/bash

# Define your rclone command
#example command rclone sync /ZFS PcloudSecure:/Backups/Promox --update --progress -L
RCLONE_CMD=""

# Define the log file path
LOG_FILE=""

# Define the sleep timeout (in seconds)
SLEEP_TIMEOUT=900  # 15 minutes

while true; do
  # Check if the command is already running
  if pgrep -f "$RCLONE_CMD" > /dev/null; then
    echo "rclone is already running. Sleeping for $SLEEP_TIMEOUT seconds..."
  else
    echo "Starting rclone synchronization..."
    nohup $RCLONE_CMD > $LOG_FILE 2>&1 &
    break
  fi

  # Sleep for the specified timeout
  sleep $SLEEP_TIMEOUT
done
