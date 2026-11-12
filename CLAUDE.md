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
4. i3 has no `unbindsym` and rejects a key bound twice, so `config` must never rebind a key from `common.conf`; move that binding out of `common.conf` into both WM configs instead. In `sway/config`, `unbindsym` the key before rebinding it, or sway warns and shows its config-error bar.
5. Variables (`$mod`, `$exec`, `$ws1`...) used by a WM config's own bindings must be set in that file before the `include`; i3 does not expand `common.conf`'s copies there.
6. `class=` rules match X11/XWayland only; native Wayland windows need `app_id=` rules in `sway/config`.
7. Scripts the config runs (`i3-term`, `i3-status-*`, `sway-*`) live in `~/bin`, a separate repo. Commit them there.
8. `sway/setup.sh` installs packages and links `~/.config/sway`, `~/.config/waybar` and `~/.config/dunst`. Add any new package a script needs there.
9. The sway bar is Waybar (`sway/waybar/`); i3 uses `i3blocks.conf`. Keep the two showing the same blocks.
10. In `sway/config`, mark each line that differs from i3 with a `# SWAY:` comment saying why.
11. Use `exec_always` for commands that set state a reload resets or another session can overwrite, such as the session environment, the output layout, and X resources. Use `exec` for daemons and apps, since `exec_always` starts another copy on every reload.
12. Sway has no primary output. Never write `focus output primary` in `common.conf` or `sway/config`; call `i3-focus-primary` or `i3-gather`, which use the primary output under i3 and the leftmost active output under sway.

### Verify
- i3: `i3 -C -c config` from the repo root.
- sway: `sway -C -c config` from `sway/`, so `include ../common.conf` resolves.
- Scripts: from the repo root, list every command the configs run that is not on PATH. The config checks above do not catch a missing script. Each name it prints must be removed or made optional (rule 2):
  ```bash
  grep -h -v -E '^\s*#' common.conf config sway/config | grep -o -E '\bexec(_always)?( +--no-startup-id)? +"?[^ ";]+' | awk '{print $NF}' | tr -d '"' | grep -v '^\$' | sort -u | while read -r name; do command -v "$name" >/dev/null || echo "missing: $name"; done
  ```
- Apply with `swaymsg reload` only after all three checks pass.

