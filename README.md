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

| Name | Hex |
|------|-----|
| Void Abyss | <span style="border-bottom: 3px solid #101010; padding-bottom: 2px;">`#101010`</span> |
| Deep Obsidian | <span style="border-bottom: 3px solid #262626; padding-bottom: 2px;">`#262626`</span> |
| Slate Core | <span style="border-bottom: 3px solid #333333; padding-bottom: 2px;">`#333333`</span> |
| Glacier Blue | <span style="border-bottom: 3px solid #2e6da4; padding-bottom: 2px;">`#2e6da4`</span> |
| Void Green | <span style="border-bottom: 3px solid #478061; padding-bottom: 2px;">`#478061`</span> |
| Forest Canopy | <span style="border-bottom: 3px solid #295340; padding-bottom: 2px;">`#295340`</span> |
| Lichen Glow | <span style="border-bottom: 3px solid #62b086; padding-bottom: 2px;">`#62b086`</span> |
| Crimson Dawn | <span style="border-bottom: 3px solid #a94442; padding-bottom: 2px;">`#a94442`</span> |
| Solar Amber | <span style="border-bottom: 3px solid #f0ad4e; padding-bottom: 2px;">`#f0ad4e`</span> |
| Mist Gray | <span style="border-bottom: 3px solid #cccccc; padding-bottom: 2px;">`#cccccc`</span> |
| Star White | <span style="border-bottom: 3px solid #ffffff; padding-bottom: 2px;">`#ffffff`</span> |

## Install

Using [GNU Stow](https://www.gnu.org/software/stow/):

```bash
cd titties
stow .
```

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
