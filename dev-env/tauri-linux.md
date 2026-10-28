# Tauri prerequisites — Linux

Debian/Ubuntu:
```sh
sudo apt install build-essential curl wget file libxdo-dev libssl-dev libayatana-appindicator3-dev librsvg2-dev
```
Arch:
```sh
sudo pacman -S webkit2gtk-4.1 base-devel curl wget file libxdo openssl appmenu-gtk-module librsvg
```
Per-distro lists drift; the authoritative source is the Tauri docs.
