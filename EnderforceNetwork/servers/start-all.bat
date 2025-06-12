@echo off
rem Start all backend servers with basic flags
for %%S in (lobby survival creative pvp events) do (
  echo Starting %%S...
  rem java -Xms1G -Xmx1G -jar paper.jar nogui
  rem Placeholder command
  ping -n 2 127.0.0.1 >nul
  echo %%S started
)

