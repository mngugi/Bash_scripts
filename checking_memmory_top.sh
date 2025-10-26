#!/bin/bash



top -p $(pidof nginx | tr ‘ ‘ ‘,’ | cut -d’,’ -f1-20)
