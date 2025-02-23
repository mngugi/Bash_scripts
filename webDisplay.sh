#!/bin/sh
# show web page in a dialog with a next step action
#
theurl="https://developer.gnome.org"
 
zenity --text-info --title="Background Reading" --html --url=$theurl \
       --checkbox="I read it...and I'm good to go"
rc=$?
echo $rc
case $rc in
    0)
        echo "Start some next step"
    # next step
    ;;
    1)
        echo "Stop installation!"
    ;;
   -1)
        echo "An unexpected error has occurred."
    ;;
esac
