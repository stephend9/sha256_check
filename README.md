# SHA256 Check Extension for Nemo File Manager

This extension adds a right-click context menu item in the Nemo file manager on Linux Mint to compute and compare the SHA256 hash of files.

## Features

- Compute SHA256 hash for any selected file.
- Prompt for the expected hash value and compare it with the computed hash.
- Display the computed hash and indicate whether it matches the expected value.

## Installation

To install the SHA256 Check extension, follow these steps:

1. Ensure that `zenity` and `nemo` are installed on your system (these are typically installed by default on Linux Mint).
2. Download the latest release of SHA256 Check from the [GitHub repository](https://github.com/stephend9/sha256_check).
3. Extract the package to a known directory.
4. Open a terminal and navigate to the directory containing `install.sh`.
5. Run the installation script with the command `./install.sh`.

A progress window will appear showing the installation status. Once complete, a message will inform you that the installation has succeeded and Nemo will be restarted.

## Usage

After installation:

1. Right-click on any file in Nemo.
2. Select "Check SHA256 Hash" from the context menu.
3. Enter the expected SHA256 hash in the input box that appears.
4. A dialog will display the computed SHA256 hash and indicate whether the hashes match.

## Uninstallation

To uninstall the SHA256 Check extension, follow these steps:

1. Navigate to the directory containing `uninstall.sh`.
2. Run the uninstallation script with the command `./uninstall.sh`.

You will be asked to confirm the uninstallation. Please note that Nemo will restart as part of the uninstallation process, closing all open file browser windows.

## Dependencies

- Zenity
- Nemo File Manager

These dependencies are installed by default on Linux Mint.

## License

SHA256 Check is licensed under the GNU General Public License v3.0.

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check the [issues page](https://github.com/stephend9/sha256_check/issues) if you want to contribute.

## Contact

Stephen D - [@stephend9](https://twitter.com/stephend9) - stephend9@gmail.com

Project Link: [https://github.com/stephend9/sha256_check](https://github.com/stephend9/sha256_check)
