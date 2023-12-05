#!/bin/bash
# SHA256 Check - Version 0.1.0

# Check if a file path is provided
if [ "$#" -ne 1 ]; then
    zenity --error --title="Error" --text="Usage: $0 <file_path>" --width=300
    exit 1
fi

# The file path is the first argument
file_path="$1"

# Check if the file exists
if [ ! -f "$file_path" ]; then
    zenity --error --title="Error" --text="Error: File does not exist." --width=300
    exit 1
fi

# Compute the SHA256 hash
computed_hash=$(sha256sum "$file_path" | awk '{ print $1 }')

# Prompt the user to enter the expected hash
expected_hash=$(zenity --entry --title="Verify SHA256 Hash" --text="Enter the expected SHA256 hash (max 64 characters):" --width=550 --entry-text "")

# If the user cancels the input box, exit
if [ -z "$expected_hash" ]; then
    exit 1
fi

# Check if the expected hash length is more than 64 characters
if [ "${#expected_hash}" -gt 64 ]; then
    zenity --error --title="Input Error" --text="The entered hash is too long. Maximum 64 characters allowed." --width=300
    exit 1
fi

# Compare the hashes and construct a message
if [ "$computed_hash" = "$expected_hash" ]; then
    match_message="✅ The SHA256 hash matches the expected value."
else
    match_message="❌ The SHA256 hash does not match the expected value."
fi

# Display the computed hash, expected hash, and the result of the comparison
zenity --info --title="SHA256 Hash Check" --text="Computed SHA256 hash:\n$computed_hash\n\nExpected SHA256 hash:\n$expected_hash\n\n$match_message" --width=550

