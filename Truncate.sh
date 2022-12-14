#!/usr/bin/env bash

echo "Print lines in the text file"
read LINES

COUNT=1
while [ $COUNT -le $LINES ]
do 

    echo "$COUNT $RANDOM" >> file.txt
    {{COUNT++}}
done    



