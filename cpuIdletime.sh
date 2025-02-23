zenity --info --text=$(top -n 1 | grep %cpu | awk '{print $8}') --title="CPU Idle Time "
