# img2txt
 This simple script takes an image file as input and extracts the text content from the image using Tesseract-OCR, displaying the extracted text on the terminal. Currently it only supports the English alphabet.

 ## Setup
 Install Tesseract-OCR on your system. You can use package managers like apt or brew to install it. Make sure it's properly configured and the tesseract command is accessible from the command line.
 Install the required Python dependencies. You can install them using pip:
 ```pip install pytesseract ```
 
 ## Usage
 ```python3 img2txt.py /path/to/file.jpg```

 ## Support
 - The script works on Linux but it can be adapted to work on Windows by changing the path to the Tesseract-OCR executable on the variable "pytesseract.pytesseract.tesseract" on line 8.
 - Currently the script only supports the English alphabet but I plan on adding support for more languages in the future.  
