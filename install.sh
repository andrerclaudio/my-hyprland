#!/bin/bash

cat << "EOF"
    ____           __        ____         
   /  _/___  _____/ /_____ _/ / /__  _____
   / // __ \/ ___/ __/ __ `/ / / _ \/ ___/
 _/ // / / (__  ) /_/ /_/ / / /  __/ /    
/___/_/ /_/____/\__/\__,_/_/_/\___/_/     
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

# Define variables

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$(pwd)/DOTFILES/.config"
BACKUP_DIR="${CONFIG_DIR}/hyprland-oldconfigs"
VERSION=$(date +"%Y%m%d_%H%M%S")

# Handle success or failure messages

check_status() {
  if [ $? -eq 0 ]; then
    echo "Operation successful!"
  else
    echo "Operation failed."
    exit 1
  fi
}

# Create backup directory

mkdir -p "$BACKUP_DIR/$VERSION"

# List of directories to backup and copy 

DIRS_TO_COPY=(
  "hypr"    
  "kitty"
  "mako"
  "rofi"
  "waybar"
  "wlogout"
  "wallpapers"
)

# Backup old configurations

for dir in "${DIRS_TO_COPY[@]}"; do
  if [ -d "$CONFIG_DIR/$dir" ]; then
    echo "Backing up existing configuration: $CONFIG_DIR/$dir to $BACKUP_DIR/$VERSION/$dir"
    mv "$CONFIG_DIR/$dir" "$BACKUP_DIR/$VERSION"
    check_status
  fi
done

# Copy new configurations

for dir in "${DIRS_TO_COPY[@]}"; do
    echo "Copying new configuration from $DOTFILES_DIR/$dir to $CONFIG_DIR/$dir"
    cp -r "$DOTFILES_DIR/$dir" "$CONFIG_DIR/"
    check_status
done

# starship promt configuration

PROMT="$(pwd)/DOTFILES/.config/starship.toml"
OLD_PROMT="$HOME/.config/starship.toml"

# Copy starship promt

if [ -f "$OLD_PROMT" ]; then
  echo "Backing up existing configuration: $OLD_PROMT to $BACKUP_DIR"
  mv "$OLD_PROMT" "$BACKUP_DIR/"
  check_status
fi

# Copy new configuration

echo "Copying new configuration from $PROMT to $CONFIG_DIR"
cp "$PROMT" "$CONFIG_DIR/" 
check_status

cat << "BYE"
   _____      __                 _                             __     
  / ___/___  / /___  ______     (_)____   ________  ____ _____/ /_  __
  \__ \/ _ \/ __/ / / / __ \   / / ___/  / ___/ _ \/ __ `/ __  / / / /
 ___/ /  __/ /_/ /_/ / /_/ /  / (__  )  / /  /  __/ /_/ / /_/ / /_/ / 
/____/\___/\__/\__,_/ .___/  /_/____/  /_/   \___/\__,_/\__,_/\__, /  
                   /_/                                       /____/   
BYE
echo "Everything should be ok for now, please report if smth went wrong."
echo "Thank you for using my dots, have a great day!"
