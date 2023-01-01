# Bash-Scripts-
This a review of Bash Script Codding 
Welcome to the Bash-Scripts- wiki!
Dockerfile
```Bash
FROM python:3.10.1-bullseye

RUN pip install --upgrade pip\
    && pip install pandas\
    && pip install ipython\
```    
    
    
This Dockerfile installs the latest version of pip, and then uses pip to install the pandas and IPython packages.

The FROM directive specifies the base image that the Docker container will use. In this case, it's using the python:3.10.1-bullseye image, which is a version of the official Python Docker image that includes Python 3.10.1.

The RUN directive is used to run commands in the context of the Docker container. The pip install commands use pip to install the specified packages. The --upgrade flag ensures that pip installs the latest version of the package, rather than a potentially outdated version that may be included in the base image.

Once the Docker container is built and run using this Dockerfile, it will have Python 3.10.1 and the pandas and IPython packages installed and ready to use.

Evaluating_Conditions.sh
Code:
```Bash
#!/usr/bin/env bash
touch one.txt\
    && touch Fruits.txt\
    && touch Meat.txt\
    && touch Cereals.txt\
    && touch Vegatables.txt\
    
    # count files created
    ls *.txt | wc -l
 ```   
    
This script creates five text files and then counts the number of text files in the current directory.

The touch command is used to create empty files. The script creates one file named one.txt and four files with names that contain spaces: Fruits.txt, Meat.txt, Cereals.txt, and Vegatables.txt.

The ls command lists the files in the current directory. The *.txt wildcard tells ls to list only files with names that end in .txt.

The wc command counts the number of lines, words, and characters in a file or in the output of another command. The -l flag tells wc to count only the number of lines. In this case, wc is counting the number of text files listed by ls, which is the same as the number of text files created by the script.

When this script is run, it will create five text files and then output the number 5.
