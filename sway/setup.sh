#!/usr/bin/env bash
# USAGE: setup.sh
# DESCRIPTION: Install sway dependencies (sway analog of ~/.config/i3/install.bash)
# i3 stays installed and untouched; sway shows up as a separate session at the
# login screen. Post-switch tasks live in ~/SWAY_NEXT.md.

packages=()

# Core (sway ships swaybar/swaynag/swaymsg; i3blocks feeds swaybar as-is)
packages+=(sway)
packages+=(i3blocks)
packages+=(swaylock)      # i3lock equivalent
packages+=(swayidle)      # xss-lock equivalent (lock on suspend/lock-session)
packages+=(swaybg)        # feh --bg-fill equivalent

# Output layouts (replaces the xrandr i3-setup-monitors scripts)
packages+=(kanshi)

# Launcher and text prompts (dmenu/rofi/i3-input equivalents; used by wl-prompt)
packages+=(fuzzel)

# Notifications (dunst runs natively on Wayland)
packages+=(dunst)

# Screenshots and clipboard (maim/scrot/xclip equivalents)
packages+=(grim)
packages+=(slurp)
packages+=(wl-clipboard)
packages+=(flameshot)     # GUI fallback used by i3-screenshot

# Brightness (xbacklight equivalent; also works on the AMD panel)
packages+=(brightnessctl)

# Screen sharing for Zoom/browsers (Wayland needs a portal + PipeWire)
packages+=(xdg-desktop-portal-wlr)
packages+=(pipewire)

# Fingerprint unlock
packages+=(fprintd)

# Battery status
packages+=(acpi)

# Volume control
packages+=(pulseaudio-utils)

# Mic control
packages+=(alsa-utils)

# Media control
packages+=(playerctl)

sudo apt update
sudo apt install -y "${packages[@]}"

