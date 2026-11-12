### Layout
```
.
├── common.conf          # settings, rules and bindings shared by i3 and sway
├── config               # i3 only; includes common.conf
├── i3blocks.conf        # i3's status bar blocks
├── install.bash         # installs i3 packages
├── dunst/
│   └── dunstrc          # notification popups, used by both
└── sway/
    ├── config           # sway only; includes ../common.conf
    ├── setup.sh         # installs sway packages and links the config folders
    └── waybar/
        ├── config.jsonc # sway's bar modules
        └── style.css    # sway's bar colors and spacing
```

### Rules
1. This repo is public on GitHub. Never add hostnames, internal paths, or anything that names private scripts' locations.
2. Call scripts by name, never by path. A script that only exists on some machines must be optional: `command -v name >/dev/null || exit 0; exec name`, so other machines hide the block silently.
3. `common.conf` is included by both `config` (i3) and `sway/config`. Every line in it must parse under both; WM-specific lines go in the WM's own config.
4. A key bound in `common.conf` must be `unbindsym`'d before a WM config rebinds it; sway otherwise warns and shows its config-error bar.
5. Variables (`$mod`, `$exec`, `$ws1`...) used by a WM config's own bindings must be set in that file before the `include`; i3 does not expand `common.conf`'s copies there.
6. `class=` rules match X11/XWayland only; native Wayland windows need `app_id=` rules in `sway/config`.
7. Scripts the config runs (`i3-term`, `i3-status-*`, `sway-*`) live in `~/bin`, a separate repo. Commit them there.
8. `sway/setup.sh` installs packages and links `~/.config/sway`, `~/.config/waybar` and `~/.config/dunst`. Add any new package a script needs there.
9. The sway bar is Waybar (`sway/waybar/`); i3 uses `i3blocks.conf`. Keep the two showing the same blocks.
10. In `sway/config`, mark each line that differs from i3 with a `# SWAY:` comment saying why.

### Verify
- i3: `i3 -C -c config` from the repo root.
- sway: `sway -C -c config` from `sway/`, so `include ../common.conf` resolves.
- Apply with `swaymsg reload` only after both checks pass.

