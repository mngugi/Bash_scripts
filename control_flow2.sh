#!/usr/bin/env bash
echo "====================================="
echo "     For Loop"
echo "====================================="
declare -a array=("Apple" "Orange" "Pineapple" "Cherry")

for i in "${array[@]}"
do
    echo "This ${i} is delicious"
done    
