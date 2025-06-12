@echo off
rem Start the entire Enderforce Network (proxy and backend servers)
set LOG_FILE=EnderforceNetwork\startup.log
if not exist EnderforceNetwork mkdir EnderforceNetwork

for /f "tokens=2 delims=:" %%I in ('findstr /b "bind" EnderforceNetwork\config\velocity.toml') do set PORT=%%I

for /f "tokens=14" %%I in ('ipconfig ^| find "IPv4"') do set IP=%%I

echo [INFO] Starting Enderforce Network > %LOG_FILE%
echo [INFO] Detected IP: %IP% >> %LOG_FILE%
echo [INFO] Proxy will run on %IP%:%PORT% >> %LOG_FILE%
echo [INFO] Starting proxy... >> %LOG_FILE%
call EnderforceNetwork\proxy\start-proxy.bat >> %LOG_FILE% 2>&1

echo [INFO] Starting backend servers... >> %LOG_FILE%
call EnderforceNetwork\servers\start-all.bat >> %LOG_FILE% 2>&1

echo [INFO] Enderforce Network started >> %LOG_FILE%

