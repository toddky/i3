#!/usr/bin/env bash
# USAGE: install.bash
# DESCRIPTION: Install i3 dependencies

packages=()

# Core
packages+=(i3)
packages+=(i3blocks)
packages+=(i3status)
packages+=(i3lock)

# Compositor and launcher
packages+=(picom)
packages+=(rofi)

# Notifications
packages+=(dunst)

# Screenshots
packages+=(flameshot)
packages+=(maim)
packages+=(xclip)

# Fingerprint unlock
packages+=(fprintd)

# Battery status
packages+=(acpi)

sudo apt update
sudo apt install -y "${packages[@]}"
