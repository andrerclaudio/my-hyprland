#!/bin/bash

cat << "EOF"
________             _____       ___________            
____  _/_______________  /______ ___  /__  /____________
 __  / __  __ \_  ___/  __/  __ `/_  /__  /_  _ \_  ___/
__/ /  _  / / /(__  )/ /_ / /_/ /_  / _  / /  __/  /    
/___/  /_/ /_//____/ \__/ \__,_/ /_/  /_/  \___//_/

EOF

# variables for making text bold

bold=$(tput bold)
normal=$(tput sgr0)

# asking if user wants to install configs

while true; do
  read -p "${bold}DO YOU WANT TO START THE INSTALLATION NOW?${normal} (Yy/Nn): " yn
  case $yn in
  [Yy]*)
    echo ":: Installation started."
    echo
    break
   ;;
  [Nn]*)
    echo ":: Installation canceled"
    exit
    break
   ;;
  *)
    echo ":: Please answer yes or no."
    ;;
  esac
done


# checking if .config directory exists

if test ! -d ~/.config/; then
  echo "Did not find ${bold}~/.config${normal} directory, creating..."
  mkdir ~/.config/

  if [ $? -eq 0 ]; then
    echo "Created ${bold}~/.config/${normal} directory!"
  else
    echo "Could not create ${bold}~/.config/${normal} directory :("
    exit 1
  fi
fi

# installing hypr directory

if test -d ~/.config/hypr/; then
  echo "Found ${bold}~/.config/hypr${normal} directory, backuping it into ${bold}~/.config/hypr-backup..."
  mv ~/.config/hypr/ ~/.config/hypr-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/hypr-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/hypr ~/.config/
echo "Copied ${bold}hypr${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing waybar directory

if test -d ~/.config/waybar/; then
  echo "Found ${bold}~/.config/waybar${normal} directory, backuping it into ${bold}~/.config/waybar-backup..."
  mv ~/.config/waybar/ ~/.config/waybar-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/waybar-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/waybar ~/.config/
echo "Copied ${bold}waybar${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing kitty directory

if test -d ~/.config/kitty/; then
  echo "Found ${bold}~/.config/kitty${normal} directory, backuping it into ${bold}~/.config/kitty-backup..."
  mv ~/.config/kitty/ ~/.config/kitty-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/kitty-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/kitty ~/.config/
echo "Copied ${bold}kitty${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing mako directory

if test -d ~/.config/mako/; then
  echo "Found ${bold}~/.config/mako${normal} directory, backuping it into ${bold}~/.config/mako-backup..."
  mv ~/.config/mako/ ~/.config/mako-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/mako-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/mako ~/.config/
echo "Copied ${bold}mako${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing starship.toml file

if test -f ~/.config/starship.toml; then
  echo "Found ${bold}~/.config/starship.toml${normal} file, backuping it into ${bold}~/.config/starship-backup.toml..."
  mv ~/.config/starship.toml ~/.config/starship-backup.toml
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/starship-backup.toml${normal} file"
  fi
fi

cp DOTFILES/.config/starship.toml ~/.config/
echo "Copied ${bold}starship${normal} file from this repo to ${bold}~/.config/${normal} directory"

# installing wallpapers directory

if test -d ~/.config/wallpapers/; then
  echo "Found ${bold}~/.config/wallpapers/${normal} directory, backuping it into ${bold}~/.config/wallpapers-backup..."
  mv ~/.config/wallpapers ~/.config/wallpapers-backup
   if [ $? -eq 0 ]; then
    echo "Now your old wallpapers are in ${bold}~/.config/wallpapers-backup${normal} directory"
  fi
fi

cp -r wallpapers ~/.config/
echo "Copied ${bold}wallpapers${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing rofi directory

if test -d ~/.config/rofi/; then
  echo "Found ${bold}~/.config/rofi${normal} directory, backuping it into ${bold}~/.config/rofi-backup..."
  mv ~/.config/rofi/ ~/.config/rofi-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/rofi-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/rofi ~/.config/
echo "Copied ${bold}rofi${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing wlogout directory

if test -d ~/.config/wlogout/; then
  echo "Found ${bold}~/.config/wlogout${normal} directory, backuping it into ${bold}~/.config/wlogout-backup..."
  mv ~/.config/wlogout/ ~/.config/wlogout-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/wlogout-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/wlogout ~/.config/
echo "Copied ${bold}wlogout${normal} directory from this repo to ${bold}~/.config/${normal} directory"


# installing .face file
#

if test -f ~/.face; then
  echo "Found ${bold}~/.face${normal} file, backuping it into ${bold}~/.face-backup..."
  mv ~/.face ~/.face-backup   
  if [ $? -eq 0 ]; then
    echo "Now your old avatar is in ${bold}~/.face-backup${normal} file"
  fi
fi

cp .face ~/
echo "Copied ${bold}.face${normal} file from this repo to ${bold}home${normal} directory"

cat << "BYE"
__  __                       ______              ______________   ______            ____________             
_ \/ /_________  __   __________  /___________  ____  /_____  /   ___  /______      ___  __/__(_)___________ 
__  /_  __ \  / / /   __  ___/_  __ \  __ \  / / /_  /_  __  /    __  __ \  _ \     __  /_ __  /__  __ \  _ \
_  / / /_/ / /_/ /    _(__  )_  / / / /_/ / /_/ /_  / / /_/ /     _  /_/ /  __/     _  __/ _  / _  / / /  __/
/_/  \____/\__,_/     /____/ /_/ /_/\____/\__,_/ /_/  \__,_/      /_.___/\___/      /_/    /_/  /_/ /_/\___/ 
BYE

echo "Everything should be ok for now, please report if smth went wrong."
echo "Thank you for using my dots, have a great day!"
