# img2txt
img2txt is a simple utility that takes an image file as input and extracts the text content from the image using Tesseract-OCR, displaying the extracted text in the terminal. Currently, it only supports the English alphabet. You can run it as a standalone Python script or install it onto your system as a utility.

## Setup
### Manual method
- Install Tesseract-OCR on your system. You can use package managers like dnf, apt, or brew to install it. Make sure it's properly configured, and the "tesseract" command is accessible from the command line.
- Install the required Python dependencies. You can install them using pip: `pip install pytesseract`.

#### Add an alias [OPTIONAL]
To simplify the execution of the script, you can add an alias by following these steps:
- Open the .bashrc file located in your home directory using a text editor: `nano ~/.bashrc`.
- Scroll to the end of the file and add the following line: `alias img2txt='python3 /path/to/img2txt.py'`.
- Replace "/path/to/img2txt.py" with the actual path where you have downloaded img2txt.py.
- Save the changes and exit the text editor.
- Run this command on your terminal `source ~/.bashrc`
- After adding the alias, you can use the "img2txt" command followed by the image file path to execute the script directly from the terminal: `img2txt /path/to/file.jpg`.

### Automated method (Tested on Fedora 38 and should work on Ubuntu and its derivatives)
To quickly install and use the img2txt utility, follow these steps:
- Open a terminal.
- Navigate to the directory where you have the repository files.
- Run the installation script using the following command: `bash install.sh`.
- You will be prompted to enter your password. This is required to install dependencies and copy the script to the appropriate location.
- Once the installation completes successfully, you can start using the img2txt utility.
- To convert an image to text, run the command `img2txt /path/to/file.jpg`, replacing "/path/to/file.jpg" with the actual path to your image file.

## Usage
- `python3 img2txt.py /path/to/file.jpg`
- If installed via the script: `img2txt /path/to/file.jpg`

## Support
- The script works on Linux, but it can be adapted to work on Windows by changing the path to the Tesseract-OCR executable in the variable "pytesseract.pytesseract.tesseract".
- Currently, the script only supports the English alphabet, but I plan on adding support for more languages in the future.
