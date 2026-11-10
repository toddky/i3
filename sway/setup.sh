#!/usr/bin/env bash
# USAGE: setup.sh
# DESCRIPTION: Link ~/.config/sway to this directory and ~/.config/waybar to its waybar directory, and install sway dependencies

# ==============================================================================
# SETUP
# ==============================================================================
# pwd -P resolves the symlink, so running ~/.config/sway/setup.sh still finds the real directory.
sway_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

# link-config <target dir> <link path>
link-config() {
	local target_dir="$1"
	local link_dir="$2"
	if [[ "$(readlink -f "$link_dir")" == "$target_dir" ]]; then
		echo "$link_dir already links to $target_dir"
	elif [[ -e "$link_dir" || -L "$link_dir" ]]; then
		echo "ERROR: $link_dir exists and is not a link to $target_dir; move it aside and re-run." 1>&2
		exit 1
	else
		ln -s "$target_dir" "$link_dir" || exit 1
		echo "Linked $link_dir -> $target_dir"
	fi
}

link-config "$sway_dir" "$config_dir/sway"
# Waybar only reads its default config location when sway launches it as the bar.
link-config "$sway_dir/waybar" "$config_dir/waybar"


# ==============================================================================
# INSTALL
# ==============================================================================
packages=()

# Core (sway ships swaynag/swaymsg)
packages+=(sway)
packages+=(waybar)        # replaces swaybar, which can't open tray-icon menus
packages+=(i3blocks)      # i3 bar under i3; Waybar reuses its bandwidth script
packages+=(swaylock)      # i3lock equivalent
packages+=(swayidle)      # xss-lock equivalent (lock on suspend/lock-session)
packages+=(swaybg)        # feh --bg-fill equivalent

# Output layouts (replaces the xrandr i3-setup-monitors scripts)
packages+=(kanshi)

# Launcher and text prompts (dmenu/rofi/i3-input equivalents; used by wl-prompt)
packages+=(fuzzel)

# Bluetooth popup menu from the bar (sway-bluetooth-picker)
packages+=(wofi)
packages+=(bluez)          # bluetoothctl
packages+=(jq)             # parses swaymsg JSON; sway-monitors needs it too

# Notifications (dunst runs natively on Wayland)
packages+=(dunst)
packages+=(libnotify-bin)  # notify-send, used by the bar scripts to show errors

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


# ==============================================================================
# GROUPS
# ==============================================================================
# brightnessctl writes /sys/class/backlight/*/brightness, which only root and the video group may change.
if id -nG "$USER" | grep -qw video; then
	echo "$USER is already in the video group"
else
	sudo usermod -aG video "$USER" || exit 1
	echo "Added $USER to the video group; log out and back in for brightness keys to work"
fi

