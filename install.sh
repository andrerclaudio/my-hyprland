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

# Function to handle success or failure messages
check_status() {
  if [ $? -eq 0 ]; then
    echo "Operation successful."
  else
    echo "Operation failed!"
    exit 1
  fi
}

# Define variables
CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$(pwd)/DOTFILES/.config"
BACKUP_DIR="${CONFIG_DIR}/hyprland-oldconfigs"

if [ -d $BACKUP_DIR ]; then
  echo "Found already existing $BACKUP_DIR, deleting..."
  rm -r $BACKUP_DIR
  check_status
fi

# Create backup directory
mkdir -p "$BACKUP_DIR"

# List of directories to backup and copy. Add or remove as needed.
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
    echo "Backing up existing configuration: $CONFIG_DIR/$dir to $BACKUP_DIR/$dir"
    mv "$CONFIG_DIR/$dir" "$BACKUP_DIR/"
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
__  __                       ______              ______________   ______            ____________             
_ \/ /_________  __   __________  /___________  ____  /_____  /   ___  /______      ___  __/__(_)___________ 
__  /_  __ \  / / /   __  ___/_  __ \  __ \  / / /_  /_  __  /    __  __ \  _ \     __  /_ __  /__  __ \  _ \
_  / / /_/ / /_/ /    _(__  )_  / / / /_/ / /_/ /_  / / /_/ /     _  /_/ /  __/     _  __/ _  / _  / / /  __/
/_/  \____/\__,_/     /____/ /_/ /_/\____/\__,_/ /_/  \__,_/      /_.___/\___/      /_/    /_/  /_/ /_/\___/ 
BYE

echo "Everything should be ok for now, please report if smth went wrong."
echo "Thank you for using my dots, have a great day!"
