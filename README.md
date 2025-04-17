<div align="center">
<img alt="Profiles Pictures" src="https://github.com/user-attachments/assets/40a46c3f-364b-47aa-b2b4-5011d18f22f1" width="200" height="200"/>
</div>
<div align="center">
    <h1> Frogprog Hyprland Dotfiles</h1>
    <h4> A simple Hyprland configuration for linux (Arch). I use it as a productive setup on my thinkpad (14 inch)</h4>
</div>
</div>

### Things that are used in setup
| Sysetm part | Name |
|---|---|
| Compositor | [Hyprland](https://github.com/hyprwm/Hyprland) |
| Bar | [Waybar](https://github.com/Alexays/Waybar) |
| Lock | [Hyprlock](https://github.com/hyprwm/hyprlock) |
| App launcher | [Rofi-wayland](https://github.com/in0ni/rofi-wayland) |
| Term emulator | [Kitty](https://github.com/kovidgoyal/kitty) |
| Promt | [Starship](https://github.com/starship/starship) |

![Image](https://github.com/user-attachments/assets/98a1a4ac-9998-40cf-ac43-65405ef2b907)

![Image](https://github.com/user-attachments/assets/7c183b04-7e9f-466f-aa13-6c541ef1fc88)

## Installation

#### Install it at your own risk, though I've tried to do everything as save as possibe, there still might be bugs that I haven't discovered yet!

To install this setup I've created a script that should backup your cofings of programs that I use here in ~/.config/xxx-backup

1. My script works only with files so that is why you have to make sure that everything is installed on your system:

```bash
sudo pacman -S hyprland hyprlang hyprpaper hypridle hyprlock hyprpolkitagent waybar rofi-wayland kitty nautilus mako starship git   
```

2. Then you can copy my repo and run script that should install my setup:
```bash
git clone https://github.com/FrogProg09/my-linux.git 
cd my-linux
sh install.sh
```

And this is it! Besides I think shell setup (I use zsh), which you will need to do yourself.
For starship promt to work, if you have bash, zsh or fish installed add this to the end of your shell config:

.bashrc
```
eval "$(starship init bash)"
```

.zshrc
```
eval "$(starship init zsh)"
```

and ~/.config/fish/config.fish
```
starship init fish | source
```

## Keybindings

Feel free to change and mess around with them, nothing will break if you know what you are doing after all.
Plus even I personally haven't come up with smth 100% convinient yet.

|Keybind|Result|
|---|---|
| Super + Return | Kitty |
| Super + D | Rofi |
| Super + E | Nautilus |
| Super + B | Bluetooth manager |
| Super + S | Hyprshot |
| Super + A | Wlogout |
| Super + M | Exit hyprland |
| Super + Q | Close window |
| Super + V | Toggle floating |
| Super + F | Toggle fullscreen |
| Super + H,J,K,L | Move focus |
| Super + 1-0 | Cange workspaces |
| Super + Shift + 1-0 | Move window to workspace |

This is it for now, in the future I'm gonna add cheatsheet to waybar 

## Screenshots
![Image](https://github.com/user-attachments/assets/32d00175-a0cc-4ae7-ae4e-87bdcbb49f2a)

## Copying

You can basically do whaterver your heart desires with this repo, as long as it's under BSD-3 license. 
I would be glad if someone wanted to contribute to this repo!

## Credits

- Thanks [r/unixporn](https://www.reddit.com/r/unixporn/) for awesome inspirational setups
- Thanks [1amSimp1e](https://github.com/1amSimp1e/dots) for amaizing readme example
