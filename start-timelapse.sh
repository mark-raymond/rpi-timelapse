#!/bin/sh

if pgrep raspistill > /dev/null
then
  echo "Timelapse is already running, PID=$(pidof raspistill)."
else
  DATE=$(date +"%Y.%m.%d-%H.%M.%S")
  DIR="/home/mark/timelapse/$DATE"
  echo "Starting timelapse in $DIR..."
  mkdir -p "$DIR"
  raspistill -n -t 86400000 -tl 2500 -q 80 -o "$DIR/frame-%05d.jpg" &
  echo "Started timelapse, PID=$!."
fi
