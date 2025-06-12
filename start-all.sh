#!/bin/sh
# Start the entire Enderforce Network (proxy and backend servers)
# Logs detailed progress to EnderforceNetwork/startup.log

LOG_FILE="EnderforceNetwork/startup.log"
mkdir -p "EnderforceNetwork"

IP=$(hostname -I 2>/dev/null | awk '{print $1}')
if [ -z "$IP" ]; then
  IP=$(ip addr show | awk '/inet / && $2 !~ /^127/ { sub("/.*","",$2); print $2; exit }')
fi
PORT=$(grep -E '^bind\s*=\s*' EnderforceNetwork/config/velocity.toml | sed -n 's/.*:\([0-9]*\)"/\1/p')

{
  echo "[INFO] Starting Enderforce Network"
  echo "[INFO] Detected IP: $IP"
  echo "[INFO] Proxy will run on $IP:$PORT"
  echo "[INFO] Starting proxy..."
} | tee "$LOG_FILE"

( cd EnderforceNetwork/proxy && sh start-proxy.sh ) >> "$LOG_FILE" 2>&1 &
PROXY_PID=$!

{
  echo "[INFO] Proxy startup triggered (PID $PROXY_PID)"
  echo "[INFO] Starting backend servers..."
} | tee -a "$LOG_FILE"

( cd EnderforceNetwork/servers && sh start-all.sh ) >> "$LOG_FILE" 2>&1 &
SERVERS_PID=$!

{
  echo "[INFO] Backend servers startup triggered (PID $SERVERS_PID)"
  echo "[INFO] Waiting for child processes to exit..."
} | tee -a "$LOG_FILE"

wait $PROXY_PID $SERVERS_PID

echo "[INFO] Enderforce Network started" | tee -a "$LOG_FILE"

