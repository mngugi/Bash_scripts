// Get device creation and modification times -approximation
sudo  tune2fs -l /dev/sdb2 | grep -E "Filesystem created|Last mount time|Last write time"
 
