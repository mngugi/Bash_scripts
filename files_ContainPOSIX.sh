#! /bin/bash
echo "====================================="
echo "     Check Files with POSIX"
echo "====================================="

for file in *
 do
   if grep -l POSIX $file
   then
 echo $file
 fi
 done

exit 0
