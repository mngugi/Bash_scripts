#!/usr/bin/env bash
echo "====================================="
echo "     Evaluate Conditions"
echo "====================================="
touch one.txt\
    && touch Fruits.txt\
    && touch Meat.txt\
    && touch Cereals.txt\
    && touch Vegatables.txt\
    
    # count files created
    ls *.txt | wc -l
    
    
