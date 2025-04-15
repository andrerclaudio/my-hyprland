# Frogprog Hyprland Dotfiles

A minimalistic Hyprland configuration for linux (Arch). I use it as a productive setup on my thinkpad (14 inch).

| Sysetm part | Name |
|---|---|
| Compositor | Hyprland |
| Bar | Waybar |
| Lock | Hyprlock |
| App launcher | Rofi-wayland |
| Term emulator | Kitty |

![Image](https://github.com/user-attachments/assets/acbd0325-0c5e-46c6-8bff-53ed177ca249)

![Image](https://github.com/user-attachments/assets/f8ded207-7ed9-478a-8d4d-87be1c5c5751)

## Installation

To install this setup I've created a script that should backup your cofings of programs that I use here in ~/.config/xxx-backup
My script works only with files so that is why you have to make sure that everything is installed on your system:

```bash
sudo pacman -S hyprland hyprlang hyprpaper hypridle hyprlock hyprpolkitagent waybar rofi-wayland kitty nautilus mako starship git   
```

Then you can copy my repo and run script that should install my setup:
```bash
git clone https://github.com/FrogProg09/my-linux.git 
cd my-linux
sh install.sh
```

And this is it! Besides I think  zsh (that is what I use) setup, which you will need to do yourself.
For starship to work, if you have bash, zsh or fish installed add this to the end of your shell config:

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

## Copying

You can basically do whaterver your heart desires with this repo, as long as it's under GPL-3.0 license. 
I would be even proud if someone would want to fork this repo or help out with better dots!
