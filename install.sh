#!/bin/bash



# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}



# Function to install Python dependencies
install_dependencies() {

    # Check if pip is installed
    if ! command_exists pip; then
        # Install pip
        if command_exists dnf; then
            sudo dnf install -y python3-pip
        elif command_exists apt; then
            sudo apt install -y python3-pip
	elif command_exists pacman; then
	    sudo pacman -S --noconfirm python-pip
	elif command_exists zypper; then
	    # Should grab latest python-pip package
	    python_pkg=$(zypper se pip | grep -Eo 'python[0-9]+-pip[[:blank:]]' | tail -n 1)
            sudo zypper in -y $python_pkg
	    echo "If you are on opensuse, find the latest version of pip by using 'zypper se pip'. Install by running 'sudo zypper in python3xx-pip'."
	else
            echo "Error: Unable to detect package manager (dnf or apt)." >&2
            exit 1
        fi
    fi

    # Install pytesseract
    pip install pytesseract

}


# Function to install Tesseract or Tesseract-OCR
install_tesseract() {

    if command_exists dnf; then
        sudo dnf install -y tesseract
    elif command_exists apt; then
        sudo apt install -y tesseract-ocr
    elif command_exists pacman; then
	sudo pacman -S --noconfirm tesseract
    elif command_exists zypper; then
	sudo zypper in -y tesseract-ocr
    else
        echo "Error: Unable to detect package manager (dnf or apt)." >&2
        exit 1
    fi
}



# Install dependencies
install_dependencies

# Install Tesseract or Tesseract-OCR
install_tesseract



# Move the Python script to the appropriate bin directory
if [[ -d "$HOME/.local/bin" && -w "$HOME/.local/bin" ]]; then
    cp img2txt.py "$HOME/.local/bin/img2txt"
    echo "Added img2txt.py to $HOME/.local/bin/"
else
    echo "Warning: $HOME/.local/bin directory not found or not writable. Script was not added to the bin directory." >&2
    exit 1
fi

local_bin=$HOME/.local/bin
echo $local_bin

if [[  ! $PATH =~ $local_bin ]]; then
	echo "Adding 'img2txt' to path"

	# Make sure .basrc exists and is writable
	if [[ -w $HOME/.bashrc ]]; then
		echo "export PATH=$PATH:$local_bin" >> ~/.bashrc
		echo "$local_bin successfully added to path. Please restart terminal for changes to take effect."
	else
		echo -e "\n\e[0;31mWarning\e[0m: $local_bin not found or not writable.\nThe script was not able to be added to path, and will have to be manually executed.\n"
	fi

fi

# Make the script executable
chmod +x "$HOME/.local/bin/img2txt"


echo "Installation completed successfully."
