File=$(zenity --list --multiple --title "Choose file(s)" --column="Files" --column="Size" $(ls -l | awk '{print $9,$5}'))
