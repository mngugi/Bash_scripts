#!/bin/sh
theurl="https://developer.gnome.org"

# Open the URL in the default browser
xdg-open "$theurl"

zenity --question --title="Background Reading" \
       --text="Did you read the webpage?" \
       --ok-label="Yes, continue" --cancel-label="No, exit"

rc=$?

case $rc in
    0) echo "Start some next step" ;;
    1) echo "Stop installation!" ;;
   -1) echo "An unexpected error has occurred." ;;
esac

