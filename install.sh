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



# Make the script executable
chmod +x "$HOME/.local/bin/img2txt"


echo "Installation completed successfully."
