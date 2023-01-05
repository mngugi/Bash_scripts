## Welcome to the Bash-Scripts- wiki!
### Dockerfile
```bash
FROM python:3.10.1-bullseye

RUN pip install --upgrade pip\
    && pip install pandas\
    && pip install ipython\
```


This Dockerfile installs the latest version of pip, and then uses pip to install the pandas and IPython packages.

The `FROM` directive specifies the base image that the Docker container will use. In this case, it's using the `python:3.10.1-bullseye` image, which is a version of the official Python Docker image that includes Python 3.10.1.

The `RUN `directive is used to run commands in the context of the Docker container. The `pip install` commands use pip to install the specified packages. The `--upgrade` flag ensures that pip installs the latest version of the package, rather than a potentially outdated version that may be included in the base image.

Once the Docker container is built and run using this Dockerfile, it will have Python 3.10.1 and the pandas and IPython packages installed and ready to use.

-----
### Evaluating_Conditions.sh
**Code:**
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

The `touch` command is used to create empty files. The script creates one file named `one.txt` and four files with names that contain spaces: `Fruits.txt, Meat.txt, Cereals.txt,` and `Vegatables.txt`.

The `ls` command lists the files in the current directory. The `*.txt` wildcard tells ls to list only files with names that end in `.txt.`

The wc command counts the number of lines, words, and characters in a file or in the output of another command. The `-l` flag tells `wc` to count only the number of lines. In this case, `wc` is counting the number of text files listed by `ls,` which is the same as the number of text files created by the script.

When this script is run, it will create five text files and then output the number `5.`

-----
### Sample_Bashscript.sh
**Code:**
```bash
#!/usr/bin/bash -xv
#
#<Eneter comments or Code Algorithm>

#
#

# set strict mode . Causes shell to exit when command fails.
set -e
#Enables printing  of shell input lines as they are read
set -v
#Enables print of command traces before executing command
set -x
# set a variable
variable="Test"

echo "This script variable is L $variable"

```
This script is written in Bash, which is a Unix shell and command language. The first line specifies the interpreter that should be used to execute the script, in this case the Bash interpreter located at `/usr/bin/bash`. The `-xv` options passed to the interpreter enable command tracing and verbose output.

The set command is used to enable strict mode and set various shell options. In this case, the `-e` option causes the shell to exit if any command returns a non-zero exit status, the `-v` option enables printing of the input lines as they are read, and the `-x` option enables printing of command traces before the command is executed.
The script sets a variable called variable with the value `"Test"` and then prints a message containing the value of the variable.

---
### Shell_variable.sh
**Code:**
```bash
#!/bin/bash

export FOOD="Apple"
echo $FOOD
```
This script is written in Bash and is executed using the Bash interpreter located at `/bin/bash`. The script exports a variable called `FOOD` and assigns it the value `"Apple"`. The export command makes the FOOD variable available to child processes of the script.

The script then prints the value of the `FOOD` variable using the echo command. The $ symbol is used to expand the value of the FOOD variable in the command. The output of the script will be the string `"Apple"`.

---

### Truncate.sh
**Code:**
```bash
#!/usr/bin/env bash

echo "Print lines in the text file"
read LINES

COUNT=1
while [ $COUNT -le $LINES ]
do 

    echo "$COUNT $RANDOM" >> file.txt
    {{COUNT++}}
done   
```
This script is written in Bash and is executed using the Bash interpreter located at` /usr/bin/env bash`. The env command is used to locate the interpreter in the system's PATH.

The script prompts the user to enter a number of lines and stores the input in a variable called `LINES`. It then initializes a variable called `COUNT to 1`.

The script enters a loop that will execute until the value of COUNT is greater than `LINES`. On each iteration of the loop, the script writes a line to a file called `file.txt`. The line consists of the value of `COUNT` followed by a random number generated using the `RANDOM` special variable. The `>> operator` is used to append the output to the file.txt file.

After writing the line to the file, the script increments the value of `COUNT by 1` using the `((COUNT++))` expression. When the value of `COUNT` becomes greater than `LINES`, the loop will exit and the script will terminate.

---

### control_flow.sh
**Code:**
```bash
#!/bin/sh

echo  "what food do you choose?"
read FOOD

if ["$FOOD" = "Apple"]; then
    echo "Eat Yogurt with your Apple"
elif ["$FOOD" = "Milk"]; then
    echo "Eat cereal with milk"
else
    echo "Eat your {$FOOD} by itself"
    
fi           

```
This script is written in the `Bourne shell` and is executed using the interpreter located at `/bin/sh`.

The script prompts the user to enter a food and stores the input in a variable called `FOOD`. It then uses an if statement to check the value of `FOOD`.

If the value of `FOOD is "Apple"`, the script will print a message suggesting the user eat yogurt with their apple. If the value of `FOOD` is `"Milk"`, the script will print a message suggesting the user eat cereal with their milk. If the value of `FOOD` is neither `"Apple"` nor "Milk", the script will print a message suggesting the user eat the food by itself.

The `if` statement uses the `[` command to evaluate the condition in square brackets. The condition should be written as `[ "$FOOD" = "Apple" ]`. The `=` operator is used to test for equality in this case, and the " characters are used to enclose the variables in order to prevent word splitting.

The elif clause is used to specify additional conditions to test, and the else clause is used to specify a default action to take if none of the conditions are met. The `fi` keyword marks the end of the `if` statement.

---

### control_flow2.sh
**Code:**
```bash
#!/usr/bin/env bash
declare -a array=("Apple" "Orange" "Pineapple" "Cherry")

for i in "${array[@]}"
do
    echo "This ${i} is delicious"
done 

```
This script is written in Bash and is executed using the Bash interpreter located at `/usr/bin/env bash`. The `env` command is used to locate the interpreter in the system's `PATH`.

The script declares an array called array and initializes it with four elements: `"Apple", "Orange", "Pineapple",` and `"Cherry"`.

The script then uses a for loop to iterate over the elements of the array. The `for loop` is specified using the in keyword and the `${array[@]}` expression to specify the list of elements to iterate over.

On each iteration of the loop, the script prints a message containing the current element of the array. The `${i}` variable is used to expand the value of the current element in the message.

When the loop completes, the script will have printed four messages, one for each element of the array.

---

### control_flow3.sh
**Code:**
```Bash
#!/usr/bin/env bash

echo "How many loop Do you want?"

read LOOPS

COUNT=1

while [ $COUNT -le $LOOPS ]
do
    echo "Loop# $COUNT"
    ((COUNT++))
done  
```
This script is written in `Bash `and is executed using the Bash interpreter located at ``/usr/bin/env bash`. The `env` command is used to locate the interpreter in the system's `PATH`.

The script prompts the user to enter a number of loops and stores the input in a variable called `LOOPS`. It then initializes a variable called `COUNT to 1`.

The script enters a while loop that will execute until the value of `COUNT` is greater than `LOOPS`. On each iteration of the loop, the script prints a message containing the current loop number and then increments the value of `COUNT by 1` using the `((COUNT++))` expression.

When the value of `COUNT` becomes greater than `LOOPS`, the while loop will exit and the script will terminate.

---

### errors.sh
**Code:**
```bash
#!/usr/bin/bash

* Create Error
ls -l /var/kudus

* Write error to a file
ls -l /var/kudus 2 > error.txt

* Throw Error Away
ls -l /var/kudus 3 >/dev/null
```
This script is written in Bash and is executed using the Bash interpreter located at `/usr/bin/bash`.

The first command in the script attempts to list the contents of the `/var/kudus` directory, but this directory does not exist and the command will fail with an error message.

The second command also attempts to list the contents of the `/var/kudus` directory, but this time the error message is redirected to a file called error.txt using the `2 >` redirection operator. The 2 specifies that the error output (also known as standard error or stderr) should be redirected, and the `>` operator specifies that the output should be written to a file.

The third command also attempts to list the contents of the `/var/kudus` directory, but this time the error message is thrown away and not printed to the terminal or written to a file. This is done using the `3 >/dev/null` redirection operator, which redirects both the standard output (`stdout)` and standard error to the `/dev/null` device, which discards any input written to it.

---
### filtering.sh
**Code:**
```bash
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

```
This script is written in Bash and is executed using the Bash interpreter located at` /usr/bin/env bash.` The `env` command is used to locate the interpreter in the system's `PATH`.

The script prompts the user to enter a number of lines and stores the input in a variable called LINES. It then declares an array called array and initializes it with three elements: `"Football", "Baseball",` and `"Basketball".`

The script then initializes a variable called `COUNT to 1`. It enters a while loop that will execute until the value of `COUNT` is greater than `LINES`. On each iteration of the loop, the script generates a random number between `0` and `2` using the `$[$RANDOM % 3]` expression, which uses the `$RANDOM` special variable and the `%` operator to perform modulo 3 division. The value of rand will be a random integer between `0` and `2`.

The script then writes a line to a file called filter_file.txt. The line consists of the value of `COUNT` followed by the element of array at the index specified by rand. The `>> `operator is used to append the output to the filter_file.txt file.

After writing the line to the file, the script increments the value of `COUNT by 1` using the `((COUNT++))` expression. When the value of `COUNT` becomes greater than `LINES`, the while loop will exit and the script will terminate.

---

### function.sh
**Code:**
```bash
!#/usr/bin/env bash
recall() {
    echo "First call : $1"
    echo "First call : $2"
}

recall 1 2

recall 100 1000000

add() {
    x= $1
    y= $2
    z= $((x + y))
    echo $z

}

add 102 205
output=$(add 102 205)
echo  output


add $output $output
```
This script is written in Bash and is executed using the Bash interpreter located at `/usr/bin/env bash`. The `env` command is used to locate the interpreter in the system's `PATH`.

The script defines a function called recall that takes two arguments. The function prints the values of the arguments to the terminal using the echo command.

The script then calls the recall function twice with different argument values. The first call passes the arguments `1` and `2`, and the second call passes the arguments `100` and `1000000`.

The script then defines another function called add that takes two arguments and returns the sum of the arguments. The function assigns the values of the arguments to variables `x `and` y`, and then calculates the sum of `x` and `y` and stores it in a variable called z. The function prints the value of `z` to the terminal using the echo command.

The script then calls the add function twice, passing different argument values each time. The first call passes the arguments `102` and `205`, and the second call passes the output of the first call as the arguments.

The output of the add function is captured using command substitution and stored in a variable called output. The script then prints the value of output to the terminal using the echo command.

---
### standard_in.sh
**Code:**
```bash
#!/usr/bin/bash

read -p 'File: ' FILENAME
FPATH='readlink -f $FILENAME'
echo 'Full path: ' $FPATH

```
This script is written in Bash and is executed using the Bash interpreter located at `/usr/bin/bash`.

The script uses the read builtin command to prompt the user for input and store the input in a variable called `FILENAME`. The `-p` option specifies the prompt to display to the user.

The script then defines a variable called `FPATH` and assigns it the value of the command `readlink -f $FILENAME`. The `readlink` command is used to resolve the specified file's `FILENAME` to its absolute path. The `-f` option tells `readlink` to follow symbolic links until it reaches a file that is not a symbolic link.

The script then prints a message and the value of `FPATH` to the terminal using the `echo` command.

Note that `FPATH` is not being expanded to the absolute path of `FILENAME`. Instead, it is being assigned the string 'readlink -f $FILENAME' as its value. To expand `FPATH` to the absolute path of `FILENAME`, you should use the following assignment: ``FPATH=$(readlink -f "$FILENAME").`` The `$()` operator is used to run the command inside the parentheses and capture its output.

---
standard_out.sh
Code:
```bash
#!/bin/bash

echo -e "Adidas\nNike\nPuma\nNew Balance\nUnder Armor" | sort
echo -e "Adidas\nNike\nPuma\nNew Balance\nUnder Armor\nAdidas\nNike\nPuma\nNew Balance\nUnder Armor" | sort | uniq -c
ps -ef | grep python 

```
This script is written in Bash and is executed using the Bash interpreter located at `/bin/bash.`

The first command in the script uses the echo command to print a list of strings separated by newline characters `(\n)`. The -e option is used to enable interpretation of the `\n` escape sequence. The output of the echo command is piped to the sort command using the | operator. The sort command sorts the input lines lexicographically and prints the sorted output to the terminal.

The second command is similar to the first, but it also includes duplicate strings in the list. The output of the echo command is piped to the sort command as before, but the output of the sort command is then piped to the uniq command using the | operator. The uniq command filters out adjacent, duplicate lines from the input. The `-c` option tells `uniq` to `prefix` each output line with a count of the number of times the line occurred in the input.

The third command in the script uses the ps command to list the processes running on the system. The -ef options tell ps to display the full command line for each process and all processes running on the system. The output of the ps command is piped to the grep command using the | operator. The grep command searches the input for lines containing the string "python" and prints the matching lines to the terminal.

### sleep.sh
**Code:**
```bash
#!/usr/bin/bash

while true;
	do echo "Draw will favor team g ...";
	sleep 5;
	done	
```

This script is written in Bash and is executed using the Bash interpreter located at `/usr/bin/bash.`

The script enters an infinite loop using the while true construct. The loop will execute indefinitely unless it is interrupted.

Inside the loop, the script uses the echo command to print a message to the terminal and then uses the sleep command to pause the script for `5` seconds. The sleep command takes a single argument specifying the number of seconds to pause.

The loop will continue to execute, printing the message and sleeping for` 5` seconds on each iteration, until it is interrupted. To interrupt the loop, you can use the `CTRL-C `keyboard combination. This will cause the script to terminate.
