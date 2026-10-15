#!/usr/bin/env bash
# USAGE: setup.sh
# DESCRIPTION: Link ~/.config/sway to this directory and install sway dependencies

# ==============================================================================
# SETUP
# ==============================================================================
# pwd -P resolves the symlink, so running ~/.config/sway/setup.sh still finds the real directory.
sway_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
link_dir="${XDG_CONFIG_HOME:-$HOME/.config}/sway"

if [[ "$(readlink -f "$link_dir")" == "$sway_dir" ]]; then
	echo "$link_dir already links to $sway_dir"
elif [[ -e "$link_dir" || -L "$link_dir" ]]; then
	echo "ERROR: $link_dir exists and is not a link to $sway_dir; move it aside and re-run." 1>&2
	exit 1
else
	ln -s "$sway_dir" "$link_dir" || exit 1
	echo "Linked $link_dir -> $sway_dir"
fi


# ==============================================================================
# INSTALL
# ==============================================================================
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

