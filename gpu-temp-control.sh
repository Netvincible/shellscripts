#!/bin/bash
while true; do
  TEMP=$(sensors | grep 'temp1' | awk '{print $2}' | tr -d '+°C')
  if [ "$TEMP" -gt 75 ]; then
    echo "Temperature exceeded 75°C. Stopping Hashcat."
    pkill -f hashcat
    break
  fi
  sleep 5
done
