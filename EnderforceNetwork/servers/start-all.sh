#!/bin/sh
# Start all backend servers with basic flags
for server in lobby survival creative pvp events; do
  echo "Starting $server..."
  # java -Xms1G -Xmx1G -jar paper.jar nogui
  # Placeholder command; replace with actual startup line
  sleep 1
  echo "$server started"
done
