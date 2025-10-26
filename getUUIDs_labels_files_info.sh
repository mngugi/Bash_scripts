//Get UUIDs, labels, and filesystem info 

#!/bin/bash

lsblk -o NAME,LABEL,UUID,FSTYPE,MOUNTPOINT,SIZE,OWNER,GROUP,MODE


