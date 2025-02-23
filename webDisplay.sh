#!/bin/sh
# Show a web page in a dialog with a next-step action

theurl="https://developer.gnome.org"

zenity --text --title="Background Reading" \
       --text="Please visit: $theurl" \
       --ok-label="I read it... and I'm good to go"

rc=$?

case $rc in
    0)
        echo "Start some next step"
        # Add the next step command here
        ;;
    1)
        echo "Stop installation!"
        ;;
   -1)
        echo "An unexpected error has occurred."
        ;;
esac

