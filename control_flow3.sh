#!/usr/bin/env bash

echo "How many loop Do you want?"

read LOOPS

COUNT=1

while [ $COUNT -le $LOOPS ]
do
    echo "Loop# $COUNT"
    ((COUNT++))
done    
