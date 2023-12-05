#!/bin/bash

# Install script for SHA256 Check - Version 0.1.0

# The directory where the script will be installed
install_dir="$HOME/.local/bin"

# The directory where the Nemo action will be installed
actions_dir="$HOME/.local/share/nemo/actions"

# Function to display a message using zenity
show_message() {
    zenity --info --text="$1" --width=200 --height=100
}

# Function to ask for confirmation
confirm() {
    zenity --question --text="$1" --width=300 --height=100
}

# Ask for confirmation to restart Nemo at the end of the installation
if confirm "The installation will restart Nemo and close all open file browser windows. Do you want to proceed?"; then

    # Creating directories and copying files
    (
    # Create the directories if they do not exist
    mkdir -p "$install_dir" && echo "10" # progress percentage
    mkdir -p "$actions_dir" && echo "20"

    # Copy the script to the install directory and make it executable
    cp sha256_check.sh "$install_dir" && echo "50"
    chmod +x "$install_dir/sha256_check.sh" && echo "70"

    # Use sed to replace the placeholder in the .nemo_action file with the actual install path
    # Then copy the modified .nemo_action file to the actions directory
    sed "s|EXEC_PATH_PLACEHOLDER|$install_dir|g" sha256_check.nemo_action > "$actions_dir/sha256_check.nemo_action" && echo "90"

    # Finish installation
    echo "100"
    ) |
    zenity --progress \
      --title="Installing SHA256 Check" \
      --text="Installing..." \
      --percentage=0 \
      --auto-close \
      --width=300

    # Check if the install directory is in the PATH
    if [[ ":$PATH:" != *":$install_dir:"* ]]; then
        echo "export PATH=\$PATH:$install_dir" >> "$HOME/.profile"
        show_message "Added $install_dir to PATH. Please log out or restart your computer for the changes to take effect."
    fi

    # Restart Nemo
    nemo -q && nemo &

# Give Nemo a little time to close its windows
sleep 2

# Bring the Zenity window back to the front
wmctrl -a "Installing SHA256 Check"

    # Installation complete message
    show_message "Installation complete. Nemo has been restarted for the changes to take effect."
else
    show_message "Installation cancelled by the user."
fi

