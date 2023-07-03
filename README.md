# img2txt
 This simple script takes an image file as input and extracts the text content from the image using Tesseract-OCR, displaying the extracted text on the terminal. Currently it only supports the English alphabet.

 ## Setup
 - Install Tesseract-OCR on your system. You can use package managers like dnf, apt or brew to install it. Make sure it's properly configured and the tesseract command is accessible from the command line.
 - Install the required Python dependencies. You can install them using pip: ```pip install pytesseract ```
#### Add an alias [OPTIONAL]
 To simplify the execution of the script, you can add an alias by following these steps:
 - Open the .bashrc file located in your home directory using a text editor. ```nano ~/.bashrc```
 - Scroll to the end of the file and add the following line: ```alias img2txt='python3 /path/to/img2txt.py'```
 - Replace /path/to/img2txt.py with the actual path where you have downloaded img2txt.py.
 - Save the changes and exit the text editor.
 - After adding the alias, you can use the img2txt command followed by the image file path to execute the script directly from the terminal. ```img2txt /path/to/file.jpg```
 
 ## Usage
 ```python3 img2txt.py /path/to/file.jpg```

 ## Support
 - The script works on Linux but it can be adapted to work on Windows by changing the path to the Tesseract-OCR executable on the variable "pytesseract.pytesseract.tesseract".
 - Currently the script only supports the English alphabet but I plan on adding support for more languages in the future.  
