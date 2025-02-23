
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
zenity --info --text=" Cpu Idle time : %cpu_idle%" --title="CPU Idle Time "



