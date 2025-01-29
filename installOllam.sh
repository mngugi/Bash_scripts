#!/bin/bash 

sudo dnf install git
git --version

curl -fsSL https://ollama.com/install.sh | sh
ollama --version
 
sudo systemctl start ollama
sudo systemctl enable ollama

ollama run deepseek-r1:7b
