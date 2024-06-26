import shutil
import os

def copy_to_usb(file_path, usb_drive_path):
    try:
        shutil.copy(file_path, usb_drive_path)
        print("File copied successfully to USB drive.")
    except IOError as e:
        print(f"Error: {e}")

# Path to the file you want to copy
source_file_path = "/vvvv/xxxxxx9/Downloads/"

# Path to the USB drive (e.g., on Windows it might be "D:\\")
usb_drive_path = "/run/media/xxxxx/"

copy_to_usb(source_file_path, usb_drive_path)
