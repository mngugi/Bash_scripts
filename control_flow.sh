#!/bin/sh

echo "====================================="
echo "     If Control"
echo "====================================="
echo  "what food do you choose?"
read FOOD

if ["$FOOD" = "Apple"]; then
    echo "Eat Yogurt with your Apple"
elif ["$FOOD" = "Milk"]; then
    echo "Eat cereal with milk"
else
    echo "Eat your {$FOOD} by itself"
    
fi            
