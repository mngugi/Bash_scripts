#!/usr/bin/env bash
declare -a array=("Apple" "Orange" "Pineapple" "Cherry")

for i in "${array[@]}"
do
    echo "This ${i} is delicious"
done    
