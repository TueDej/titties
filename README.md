# Void Titties

A cozy set of Sway dotfiles for Void Linux. Dark, moody, and a little bit pretty — the color palette pulls from Void Linux's branding and weaves it through every config.

## What's Inside

```
.config/
├── sway/           # Window manager (Mod4, vim keys, smart gaps)
├── foot/           # Terminal (Agave, size 25)
├── fuzzel/         # App launcher
├── mako/           # Notifications
├── mpv/            # Media player
├── tmux/           # Multiplexer
├── zathura/        # PDF viewer
├── swayidle/       # Idle manager
├── swaylock/       # Lock screen
├── swaynag/        # Dialogs
├── i3status-rust/  # Status bar
└── fontconfig/     # Font rendering

.bashrc             # Shell config (OSC 133 integration, git prompt, foot app-id)
.vimrc              # Editor config (srcery, vim-plug, vim keybindings)
colors.json         # Palette source of truth
index.html          # Interactive palette preview (floating orbs)
void-colors.html    # Full Void Linux color extraction from voidlinux.org
```

## Colors

11 colors, all derived from Void Linux's website. They're used everywhere — sway borders, bar, terminal, notifications.

| Name | Hex | Swatch |
|------|-----|--------|
| Void Abyss | `#101010` | ![#101010](https://via.placeholder.com/15/101010/101010.png) |
| Deep Obsidian | `#262626` | ![#262626](https://via.placeholder.com/15/262626/262626.png) |
| Slate Core | `#333333` | ![#333333](https://via.placeholder.com/15/333333/333333.png) |
| Glacier Blue | `#2e6da4` | ![#2e6da4](https://via.placeholder.com/15/2e6da4/2e6da4.png) |
| Void Green | `#478061` | ![#478061](https://via.placeholder.com/15/478061/478061.png) |
| Forest Canopy | `#295340` | ![#295340](https://via.placeholder.com/15/295340/295340.png) |
| Lichen Glow | `#62b086` | ![#62b086](https://via.placeholder.com/15/62b086/62b086.png) |
| Crimson Dawn | `#a94442` | ![#a94442](https://via.placeholder.com/15/a94442/a94442.png) |
| Solar Amber | `#f0ad4e` | ![#f0ad4e](https://via.placeholder.com/15/f0ad4e/f0ad4e.png) |
| Mist Gray | `#cccccc` | ![#cccccc](https://via.placeholder.com/15/cccccc/cccccc.png) |
| Star White | `#ffffff` | ![#ffffff](https://via.placeholder.com/15/ffffff/ffffff.png) |

## Install

Using [GNU Stow](https://www.gnu.org/software/stow/):

```bash
cd titties
stow .
```

## Keybindings

`Mod4` (Super) is the modifier. Vim keys for navigation.

| Key | Action |
|-----|--------|
| `Mod4+Return` | Terminal |
| `Mod4+d` | App launcher |
| `Mod4+Escape` | Lock screen |
| `Mod4+f` | Fullscreen |
| `Mod4+Shift+q` | Kill window |
| `Mod4+r` | Resize mode |
| `Mod4+v` | Clipboard history |
| `Mod4+p` | Play/pause media |
| `Mod4+[` / `Mod4+]` | Previous/next workspace |
| `Mod4+1-0` | Switch to workspace |
| `Mod4+Shift+1-0` | Move window to workspace |
| `Print` | Screenshot (output) |
| `Shift+Print` | Screenshot (anything) |
| `Ctrl+Shift+Print` | Screenshot (active window) |

See `~/.config/sway/config` for the full list.

## Notes

- Terminal: foot with Agave font
- Shell: bash with git prompt and OSC 133 integration
- Editor: vim with srcery colorscheme
- Bar: i3status-rs
- Launcher: fuzzel
- Clipboard: cliphist + wl-paste
- Audio: WirePlumber (wpctl)
- Media: playerctl + playerctld
- Screen: wlsunset for night light
