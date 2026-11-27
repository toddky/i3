# i3: one config for i3 and sway

This repo is a keyboard-driven window manager config that runs under both [i3](https://i3wm.org) (X11) and [sway](https://swaywm.org) (Wayland).
Every workspace opens in tabs, focus moves with the vim keys, and the arrow keys move windows.

This page lists every key binding the sway session has, grouped by what you are trying to do.
The i3 session shares most of them, because both configs include `common.conf`.

<kbd>Super</kbd> is the Windows or Command key (`$mod`).

## 🚀 The ten to learn first

| Keys | Action |
|---|---|
| <kbd>Super</kbd> + <kbd>Space</kbd> | Open the app launcher |
| <kbd>Super</kbd> + <kbd>1</kbd> … <kbd>0</kbd> | Show workspace 1 to 10 on the current monitor |
| <kbd>Super</kbd> + <kbd>H</kbd> / <kbd>L</kbd> | Focus the column to the left or right |
| <kbd>Super</kbd> + <kbd>,</kbd> / <kbd>.</kbd> | Focus the previous or next tab |
| <kbd>Super</kbd> + <kbd>←</kbd> <kbd>↓</kbd> <kbd>↑</kbd> <kbd>→</kbd> | Move the window |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> … <kbd>0</kbd> | Send the window to a workspace and follow it |
| <kbd>Super</kbd> + <kbd>F</kbd> | Toggle fullscreen |
| <kbd>Super</kbd> + <kbd>W</kbd> | Close the window |
| <kbd>Super</kbd> + <kbd>P</kbd> | Show or hide the scratchpad terminal |
| <kbd>Super</kbd> + <kbd>Z</kbd> | Lock the screen |

---

## 🪟 Windows

### Focus

Each focus key leaves fullscreen first, so the window you land on is visible.

| Keys | Action |
|---|---|
| <kbd>Super</kbd> + <kbd>H</kbd> | Focus the column to the left, skipping the other tabs in this group |
| <kbd>Super</kbd> + <kbd>L</kbd> | Focus the column to the right, skipping the other tabs in this group |
| <kbd>Super</kbd> + <kbd>,</kbd> | Focus the tab to the left |
| <kbd>Super</kbd> + <kbd>.</kbd> | Focus the tab to the right |
| <kbd>Super</kbd> + <kbd>J</kbd> | Focus the window below |
| <kbd>Super</kbd> + <kbd>K</kbd> | Focus the window above |

### Move

| Keys | Action |
|---|---|
| <kbd>Super</kbd> + <kbd>←</kbd> | Move the window left: one tab over, then out into its own column |
| <kbd>Super</kbd> + <kbd>→</kbd> | Move the window right: one tab over, then out into its own column |
| <kbd>Super</kbd> + <kbd>↑</kbd> | Move the window into a row above its tab group |
| <kbd>Super</kbd> + <kbd>↓</kbd> | Move the window into a row below its tab group |

Moving up or down splits only the column the window is in.
With two tabs on the left and one window on the right, <kbd>Super</kbd> + <kbd>↑</kbd> gives this layout:

```
┌───────────┬───────────┐        ┌───────────┬───────────┐
│ [A] [B]   │ [C]       │        │ [A]       │ [C]       │
│           │           │   →    ├───────────┤           │
│           │           │        │ [B]       │           │
└───────────┴───────────┘        └───────────┴───────────┘
```

Moving a window back toward the other row joins the two rows into one tab group again.

### Change

| Keys | Action |
|---|---|
| <kbd>Super</kbd> + <kbd>F</kbd> | Toggle fullscreen |
| <kbd>Super</kbd> + <kbd>T</kbd> | Toggle between tiled and floating |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd> | Shrink the window to a small floating one that stays on every workspace (picture in picture) |
| <kbd>Super</kbd> + <kbd>W</kbd> | Close the window |
| <kbd>Super</kbd> + <kbd>I</kbd> | Show the window's class, app id and title |

---

## 🗂️ Workspaces

| Keys | Action |
|---|---|
| <kbd>Super</kbd> + <kbd>1</kbd> … <kbd>0</kbd> | Bring workspace 1 to 10 to the current monitor and show it |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> … <kbd>0</kbd> | Send the window to workspace 1 to 10 and follow it |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>J</kbd> | Next workspace on this monitor |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>K</kbd> | Previous workspace on this monitor |
| <kbd>Super</kbd> + <kbd>G</kbd> | Type a workspace name and go to it |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd> | Open the lowest unused workspace number |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd> | Rename the workspace |

---

## 🖥️ Monitors

| Keys | Action |
|---|---|
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>H</kbd> | Focus the monitor to the left |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>L</kbd> | Focus the monitor to the right |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd> | Move the workspace to the monitor on the left |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>→</kbd> | Move the workspace to the monitor on the right |
| <kbd>Super</kbd> + <kbd>A</kbd> | Gather every workspace onto the leftmost monitor and focus a terminal on workspace 2 |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>A</kbd> | Apply the monitor layout again after plugging in or unplugging a monitor |

---

## 🧭 Launching and finding things

| Keys | Action |
|---|---|
| <kbd>Super</kbd> + <kbd>Space</kbd> | Open the app launcher (fuzzel) |
| <kbd>Super</kbd> + <kbd>O</kbd> | Enter launcher mode (next table) |
| <kbd>Super</kbd> + <kbd>P</kbd> | Show or hide the scratchpad terminal |
| <kbd>Super</kbd> + <kbd>Enter</kbd> | Show or hide Obsidian from the scratchpad |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd> | Give the window a mark |
| <kbd>Super</kbd> + <kbd>M</kbd> | Jump to a marked window |
| <kbd>Super</kbd> + <kbd>E</kbd> | Select a region and copy a screenshot of it to the clipboard |
| <kbd>Super</kbd> + <kbd>D</kbd> | Dismiss the newest notification |
| <kbd>Super</kbd> + <kbd>?</kbd> | List the bindings in `sway/config` |

### Launcher mode

<kbd>Super</kbd> + <kbd>O</kbd> turns the mode block on the bar orange. The next key starts an app and leaves the mode.

| Key | Starts |
|---|---|
| <kbd>T</kbd> or <kbd>Enter</kbd> | Terminal |
| <kbd>B</kbd> | Brave |
| <kbd>S</kbd> | Slack |
| <kbd>G</kbd> | Gmail |
| <kbd>C</kbd> | Google Calendar |
| <kbd>Q</kbd> | Nothing; leave the mode |

---

## 📐 Resizing floating windows

<kbd>Super</kbd> + <kbd>R</kbd> enters resize mode when the focused window is floating, and turns that window orange until you leave.
On a tiled window the key does nothing.
Every resize key also centers the window again.

| Key | Action |
|---|---|
| <kbd>H</kbd> / <kbd>L</kbd> | Narrower or wider by 50 px |
| <kbd>J</kbd> / <kbd>K</kbd> | Shorter or taller by 20 px |
| <kbd>Shift</kbd> + <kbd>H</kbd> / <kbd>L</kbd> | Narrower or wider by 500 px |
| <kbd>Shift</kbd> + <kbd>J</kbd> / <kbd>K</kbd> | Shorter or taller by 200 px |
| <kbd>1</kbd> | Set the size to 1880 × 1040 |
| <kbd>2</kbd> | Set the size to 1880 × 1160 |
| <kbd>3</kbd> | Set the size to 2520 × 1400 |
| <kbd>C</kbd> | Center the window |
| <kbd>Q</kbd>, <kbd>Esc</kbd> or <kbd>Super</kbd> + <kbd>R</kbd> | Leave resize mode |

---

## 🖱️ Mouse

| Action | Result |
|---|---|
| Scroll on a title bar | Focus the previous or next window, wrapping at the ends |
| Click on a title bar | Nothing, so a stray click never changes focus |
| <kbd>Super</kbd> + drag | Move a floating window |
| <kbd>Super</kbd> + scroll up / down | Grow or shrink the window by 20 px and center it |
| <kbd>Super</kbd> + middle click | Close the window under the pointer |
| <kbd>Super</kbd> + left click | Move the workspace to the monitor on the left |
| <kbd>Super</kbd> + right click | Move the workspace to the monitor on the right |

---

## 🔊 Media and hardware keys

| Key | Action |
|---|---|
| Volume up / down | Raise or lower the volume |
| Mute | Mute the speakers |
| Mic mute | Mute the microphone |
| Play / Pause | Play or pause the media player |
| Next / Previous | Skip to the next or previous track |
| Brightness up / down | Raise or lower the screen brightness |
| Power | Lock the screen |

---

## 🔒 Session

| Keys | Action |
|---|---|
| <kbd>Super</kbd> + <kbd>Z</kbd> | Lock the screen |
| <kbd>Super</kbd> + <kbd>C</kbd> | Reload the config |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd> | Reload the config |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd> | Ask to log out |

---

## What these tables leave out

I wrote the tables by hand from `common.conf` and `sway/config`, so a binding added later is missing until someone adds it here.
`common.conf` also defines a `normal` mode with single-key versions of the focus and move bindings.
No key enters that mode, so the tables skip it.

## Try it

Most bindings run small scripts (`i3-select`, `i3-my-focus`, `i3-my-move` and others) that must be on your `PATH`.
They are in the `bin` repo linked below.

On Ubuntu, clone this repo to `~/.config/i3`, then run the sway setup script.
It installs the sway packages and links `~/.config/sway`, `~/.config/waybar` and `~/.config/dunst` into the clone.

```bash
git clone https://github.com/toddky/i3.git ~/.config/i3
~/.config/i3/sway/setup.sh
```

For the i3 session, run `~/.config/i3/install.bash` to install the i3 packages.

## Links

- Scripts: [toddky/bin](https://github.com/toddky/bin)
- Reference: [sway(5)](https://man.archlinux.org/man/sway.5), [i3 user's guide](https://i3wm.org/docs/userguide.html)
