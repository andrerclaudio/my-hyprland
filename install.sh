#!/bin/bash

cat << "EOF"
________             _____       ___________            
____  _/_______________  /______ ___  /__  /____________
 __  / __  __ \_  ___/  __/  __ `/_  /__  /_  _ \_  ___/
__/ /  _  / / /(__  )/ /_ / /_/ /_  / _  / /  __/  /    
/___/  /_/ /_//____/ \__/ \__,_/ /_/  /_/  \___//_/

EOF

# variables for making text bald

bold=$(tput bold)
normal=$(tput sgr0)

# asking if user wants to install configs

while true; do
  read -p "${bald}DO YOU WANT TO START THE INSTALLATION NOW?${normal} (Yy/Nn): " yn
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
  echo "Did not find ${bald}~/.config${normal} directory, creating..."
  mkdir ~/.config/

  if [ $? -eq 0 ]; then
    echo "Created ${bald}~/.config/${normal} directory!"
  else
    echo "Could not create ${bald}~/.config/${normal} directory :("
    exit 1
  fi
fi

# installing hypr directory

if test -d ~/.config/hypr/; then
  echo "Found ${bald}~/.config/hypr${normal} directory, backuping it into ${bald}~/.config/hypr-backup..."
  mv ~/.config/hypr/ ~/.config/hypr-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bald}~/.config/hypr-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/hypr ~/.config/
echo "Copied ${bald}hypr${normal} directory from this repo to ${bald}~/.config/${normal} directory"

# installing waybar directory

if test -d ~/.config/waybar/; then
  echo "Found ${bald}~/.config/waybar${normal} directory, backuping it into ${bald}~/.config/waybar-backup..."
  mv ~/.config/waybar/ ~/.config/waybar-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bald}~/.config/waybar-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/waybar ~/.config/
echo "Copied ${bald}waybar${normal} directory from this repo to ${bald}~/.config/${normal} directory"

# installing kitty directory

if test -d ~/.config/kitty/; then
  echo "Found ${bald}~/.config/kitty${normal} directory, backuping it into ${bald}~/.config/kitty-backup..."
  mv ~/.config/kitty/ ~/.config/kitty-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bald}~/.config/kitty-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/kitty ~/.config/
echo "Copied ${bald}kitty${normal} directory from this repo to ${bald}~/.config/${normal} directory"

# installing mako directory

if test -d ~/.config/mako/; then
  echo "Found ${bald}~/.config/mako${normal} directory, backuping it into ${bald}~/.config/mako-backup..."
  mv ~/.config/mako/ ~/.config/mako-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bald}~/.config/mako-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/mako ~/.config/
echo "Copied ${bald}mako${normal} directory from this repo to ${bald}~/.config/${normal} directory"

# installing starship.toml file

if test -f ~/.config/starship.toml; then
  echo "Found ${bald}~/.config/starship.toml${normal} file, backuping it into ${bald}~/.config/starship-backup.toml..."
  mv ~/.config/starship.toml ~/.config/starship-backup.toml
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bald}~/.config/starship-backup.toml${normal} file"
  fi
fi

cp DOTFILES/.config/starship.toml ~/.config/
echo "Copied ${bald}starship${normal} file from this repo to ${bald}~/.config/${normal} directory"

# installing wallpapers directory

if test -d ~/.config/wallpapers/; then
  echo "Found ${bald}~/.config/wallpapers/${normal} directory, backuping it into ${bald}~/.config/wallpapers-backup..."
  mv ~/.config/wallpapers ~/.config/wallpapers-backup
   if [ $? -eq 0 ]; then
    echo "Now your old wallpapers are in ${bald}~/.config/wallpapers-backup${normal} directory"
  fi
fi

cp -r wallpapers ~/.config/
echo "Copied ${bald}wallpapers${normal} directory from this repo to ${bald}~/.config/${normal} directory"

# installing rofi directory

if test -d ~/.config/rofi/; then
  echo "Found ${bald}~/.config/rofi${normal} directory, backuping it into ${bald}~/.config/rofi-backup..."
  mv ~/.config/rofi/ ~/.config/rofi-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bald}~/.config/rofi-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/rofi ~/.config/
echo "Copied ${bald}rofi${normal} directory from this repo to ${bald}~/.config/${normal} directory"


cat << "BYE"
__  __                       ______              ______________   ______            ____________             
_ \/ /_________  __   __________  /___________  ____  /_____  /   ___  /______      ___  __/__(_)___________ 
__  /_  __ \  / / /   __  ___/_  __ \  __ \  / / /_  /_  __  /    __  __ \  _ \     __  /_ __  /__  __ \  _ \
_  / / /_/ / /_/ /    _(__  )_  / / / /_/ / /_/ /_  / / /_/ /     _  /_/ /  __/     _  __/ _  / _  / / /  __/
/_/  \____/\__,_/     /____/ /_/ /_/\____/\__,_/ /_/  \__,_/      /_.___/\___/      /_/    /_/  /_/ /_/\___/ 
BYE

echo "Everything should be ok for now, please report if smth went wrong."
echo "Thank you for using my dots, have a great day!"
