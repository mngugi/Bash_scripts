#!/usr/bin/env bash

echo "Print lines in the text file"
read LINES

declare -a array=("Football" "Baseball" "Basketball")

COUNT=1
while [ $COUNT -le $LINES ]
do 
    rand=$[$RANDOM % 3]
    

    echo "$COUNT ${array[$rand]}" >> filter_file.txt
    {{COUNT++}}
done
