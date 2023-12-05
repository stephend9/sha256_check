#!/bin/bash

# Uninstall script for SHA256 Check - Version 0.1.0

# The directory where the script was installed
install_dir="$HOME/.local/bin"

# The directory where the Nemo action was installed
actions_dir="$HOME/.local/share/nemo/actions"

# Function to display a message using zenity
show_message() {
    zenity --info --text="$1" --width=300 --height=200
}

# Function to ask for confirmation
confirm() {
    zenity --question --text="$1" --width=300 --height=200
}

# Ask for confirmation before proceeding with uninstallation
if confirm "Are you sure you want to uninstall the SHA256 Check extension? This will remove all installed files and cannot be undone.\n\nPlease note: Nemo will restart as part of the uninstallation process, which will close all open file browser windows."; then

    # Remove the script and the .nemo_action file
    rm -f "$install_dir/sha256_check.sh"
    rm -f "$actions_dir/sha256_check.nemo_action"

    # Ask for confirmation before restarting Nemo
    if confirm "The uninstallation is complete. Nemo needs to restart, which will close all file browser windows. Do you want to continue?"; then
        # Restart Nemo
        nemo -q
        sleep 1
        nemo &

        # Wait for Nemo to restart
        sleep 2

        # Bring the Zenity window back to the front
        wmctrl -a "Uninstalling SHA256 Check"

        show_message "Nemo has been restarted. Uninstallation is complete."
    else
        show_message "Nemo has not been restarted. Please manually restart Nemo to complete the uninstallation."
    fi
else
    show_message "Uninstallation cancelled by the user."
fi

