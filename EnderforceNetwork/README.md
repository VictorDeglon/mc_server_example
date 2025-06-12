# Enderforce Network Setup

This repository contains a minimal folder structure and configuration for a Velocity 1.21 proxy network.

## Disclaimer
This configuration sets `online-mode=false` for cracked client support. Use of offline mode must comply with Mojang's EULA and local laws. Consider enabling FastLogin or similar for premium authentication.

## Components
- **Proxy**: Velocity 1.21 with ViaVersion, ViaBackwards and ViaRewind for 1.8-1.21 support.
- **Backend Servers**: Paper 1.21.1 with LuckPerms, WorldEdit, and EssentialsX.
- **Database**: MySQL/PostgreSQL schema provided in `database/setup.sql`.

## Permission Groups
Builder, Architect, Admin, Mod, Guest, Trusted, Elite, YouTube

## Directory Layout
```
EnderforceNetwork/
  proxy/
    velocity.jar
    plugins/
  servers/
    lobby/
    survival/
    creative/
    pvp/
    events/
  database/
    setup.sql
    config/
  config/
    velocity.toml
    server-properties
```
