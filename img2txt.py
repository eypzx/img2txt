import sys
import pytesseract
from PIL import Image



# Path to the Tesseract-OCR executable. Change this line to use in other operating systems. 
pytesseract.pytesseract.tesseract = r'/usr/bin/tesseract'



def extract_text_from_image(image_path):
    
    try:
        # open the image file
        image = Image.open(image_path)

        # convert the image to grayscale
        grayscale_image = image.convert('L')

        # use pytesseract to extract text from the image
        text = pytesseract.image_to_string(grayscale_image)

        return text
    except FileNotFoundError:
        print(f"Image file not found: {image_path}")
    except Exception as e:
        print("An error occurred:", str(e))
        print(f"Path to image: {image_path}")



def main():
    
    #Check if the image file path is provided as a command line argument
    if len(sys.argv) < 2:
        print("Usage: python3 img2txt.py <image_path>")
        return


    # get the image file from the command line argument
    image_path = sys.argv[1]

    # Extract text from the image
    extracted_text = extract_text_from_image(image_path)

    # print the extracted text
    print(extracted_text)



if __name__ == '__main__':
    main()