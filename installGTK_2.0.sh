  #!/bin/bash
# Author : Peter Mwangi Ngugi

# Display a message in Zenity
zenity --info --title="GTK3 Installation" --text="Installing GTK3 and dependencies. Please wait..."

echo "====================================="
echo "     Installing GTK3..."
echo "====================================="

# Install required packages
sudo dnf install -y gtk3-devel gstreamer1-devel clutter-devel webkit2gtk3-devel devhelp gtk3-devel-docs clutter-doc | 
zenity --progress --title="Installation Progress" --text="Installing GTK3 packages..." --pulsate --auto-close --auto-kill

# Check if the installation was successful
if [ $? -eq 0 ]; then
    zenity --info --title="Success" --text="GTK3 installation completed successfully!"
else
    zenity --error --title="Error" --text="Failed to install GTK3. Please check your internet connection or package manager."
fi

