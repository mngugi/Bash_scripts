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
filtering.sh
Code:
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

---

### Check.sh
**Code:**

```Bash
#!/bin/bash
# Simple script to list version numbers of critical development tools
export LC_ALL=C
bash --version | head -n1 | cut -d" " -f2-4
MYSH=$(readlink -f /bin/sh)
echo "/bin/sh -> $MYSH"
echo $MYSH | grep -q bash || echo "ERROR: /bin/sh does not point to bash"
unset MYSH

echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-
bison --version | head -n1

if [ -h /usr/bin/yacc ]; then
  echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
elif [ -x /usr/bin/yacc ]; then
  echo yacc is `/usr/bin/yacc --version | head -n1`
else
  echo "yacc not found"
fi

echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2
diff --version | head -n1
find --version | head -n1
gawk --version | head -n1

if [ -h /usr/bin/awk ]; then
  echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";
elif [ -x /usr/bin/awk ]; then
  echo awk is `/usr/bin/awk --version | head -n1`
else
  echo "awk not found"
fi

gcc --version | head -n1
g++ --version | head -n1
grep --version | head -n1
gzip --version | head -n1
cat /proc/version
m4 --version | head -n1
make --version | head -n1
patch --version | head -n1
echo Perl `perl -V:version`
python3 --version
sed --version | head -n1
tar --version | head -n1
makeinfo --version | head -n1  # texinfo version
xz --version | head -n1

echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ]
  then echo "g++ compilation OK";
  else echo "g++ compilation failed"; fi
rm -f dummy.c dummy

```
This script is used to list the version numbers of various development tools that are critical for building software.

The script begins by setting the LC_ALL environment variable to C and then printing the version number of bash, which is the shell being used to interpret the script. It then determines the path of the /bin/sh symbolic link and prints it. If the link does not point to bash, it prints an error message.

The script then prints the version number of binutils by running the ld command with the --version option and parsing the output. It also prints the version number of bison by running the bison command with the --version option.

Next, the script checks for the presence of yacc (a parser generator tool) on the system. If it is present, it prints the path of the /usr/bin/yacc symbolic link or the version number of yacc, depending on whether it is a symbolic link or an executable file. If yacc is not found, it prints a message to that effect.

The script then goes on to print the version numbers of various other tools, such as coreutils, gawk, gcc, g++, grep, gzip, m4, make, patch, perl, python3, sed, tar, makeinfo, and xz. It also checks if the g++ compiler can compile a simple "Hello, World!" program by creating a file called dummy.c containing a C++ source code, compiling it with g++, and checking if the resulting executable file can be run. Finally, it cleans up by removing the dummy.c and dummy files.

---

### ll.sh

`#!/bin/bash`
`ls -l`

This is a simple Bash script that lists the files and directories in the current working directory and displays detailed information about them using the ls -l command. The -l option specifies the long format, which displays the file or directory name, permissions, owner, group, size, modification time, and other information.

When you execute this script, it will display the output of the ls -l command in the terminal. You can save this script as a file with a .sh extension, give it executable permissions using chmod +x <filename>, and then run it using ./<filename>.

Note that the output of ls -l can be quite long, especially if there are many files and directories in the current working directory, so you may want to use other options to filter or sort the output, such as ls -lh to display the file sizes in a more human-readable format, or ls -l | grep <pattern> to search for specific files or directories.

---

### tcpDump.sh

`#!/bin/bash`

`sudo tcpdump -u`

This is a simple Bash script that uses the tcpdump command to capture network traffic on a system. The -u option specifies that the packets should be printed in "UDP" format.

When you execute this script with sudo, it will start capturing network traffic on the system and print the resulting packets in the terminal. Note that using sudo is necessary in order to have sufficient privileges to capture network traffic.

This script could be useful for troubleshooting network issues, analyzing network traffic for security purposes, or simply monitoring network activity. However, it is important to use this tool responsibly and with appropriate permissions, as capturing network traffic can potentially expose sensitive information.

You may want to use additional options with tcpdump to filter the captured packets by source or destination IP address, port number, protocol, or other criteria. For example, you could use sudo tcpdump -u -i eth0 host <ip_address> to capture packets only from a specific IP address, or sudo tcpdump -u -i eth0 port <port_number> to capture packets only on a specific port.

---
### telnet.sh
**Code**

```Bash
#!/bin/bash

# Prompt the user for input
echo "Enter connection IP:"
read IP

# Send an HTTP GET request to the specified IP address using telnet
(
echo "GET / HTTP/1.1"
echo "Host: $IP"
echo "Connection: close"
echo ""
sleep 1
) | telnet $IP 80

```
This is a Bash script that sends an HTTP GET request to a specified IP address using the telnet command. The script first prompts the user to enter the connection IP, and then sends an HTTP GET request to port 80 of that IP address.

The HTTP GET request is constructed using the echo command, which writes each line of the request to the standard output. The request includes the HTTP version, the host header, and the connection header. The sleep command is used to insert a one second delay before sending the request, to ensure that the telnet connection is established before the request is sent.

The request is piped to the telnet command, which establishes a connection to the specified IP address and port number (in this case, port 80). The telnet command sends the request to the remote server and displays the response in the terminal.

This script can be useful for testing HTTP connectivity to a remote server, checking for server responses and troubleshooting any connection issues. However, it should be noted that the telnet command is not a secure method of connecting to a remote server, as it sends data in plaintext. It is recommended to use a secure connection method, such as SSH or HTTPS, whenever possible.

---

### top.sh

`#!/bin/bash`
`top`

This is a Bash script that runs the top command, which displays real-time information about the processes running on a Unix or Linux system.

When you execute this script, it will display a continuously updating list of processes in the terminal, sorted by CPU usage by default. The top command also provides information about the memory usage, process IDs, user accounts, and other details about each process.

This script can be useful for monitoring system performance and identifying any processes that may be using excessive CPU or memory resources. However, the top command can consume significant system resources, especially if there are many processes running on the system, so it should be used with caution and only for short periods of time.

You may want to use additional options with top to customize the output, such as top -u <username> to display only the processes running under a specific user account, or top -p <pid> to display information about a specific process ID. You can also use the q key to quit the top command and return to the terminal prompt.

---
### traceRoute.sh
**Code**

```Bash
#!/bin/bash

# Prompt user for IP address
read -p "Enter IP address to trace: " ip_address

# Perform traceroute
traceroute $ip_address

```
This is a simple bash script that prompts the user to enter an IP address and then performs a traceroute to that address. The traceroute command is a network diagnostic tool that shows the path taken by packets from the source to the destination.

To use this script, you would save the code into a file with a .sh extension, such as trace.sh, and then make it executable using the command "chmod +x trace.sh". You can then run the script by typing "./trace.sh" in the terminal.

Note that the script assumes that the traceroute command is installed on the system. If it is not, you will need to install it before using the script. The method for installing traceroute will depend on your operating system and distribution.

---

### curl.sh
**Code**

```Bash
#!/bin/bash

# Set the URL to request
url="https://example.com"

# Make the request using curl
response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

# Print the response code
echo "Response code: $response"

```
Assuming you want to use a Bash script to perform an HTTP GET request, you can use the curl command, which is a popular command-line tool for transferring data using various protocols, including HTTP.
The first line specifies that this is a Bash script.
We set the URL we want to request to the variable url.
We use the curl command to make the request. The -s option suppresses any output except for the response code, which is sent to standard output. The -o /dev/null option redirects the response body to /dev/null so it doesn't clutter the output. The -w option allows us to specify a custom output format, which in this case is just the response code.
We capture the response code in the response variable.
We print the response code using echo. modify this script to suit your needs. For example, you could use the -H option to specify custom headers, or the -X option to specify a different HTTP method (e.g., POST instead of GET).

---

### telnetGET.sh
**Code**

```Bash
#!/bin/bash

# Get URL from user input
read -p "Enter URL: " url

# Extract host and port from URL
host=$(echo "$url" | awk -F/ '{print $3}')
port=$(echo "$url" | awk -F/ '{print $1}' | awk -F: '{print $2}')

# Connect to host using telnet
exec 3<>/dev/tcp/"$host"/"$port"
echo -e "GET / HTTP/1.1\r\nHost: $host\r\n\r\n" >&3

# Read response headers from telnet output
while read -r line; do
  echo "$line"
done <&3

# Close telnet connection
exec 3<&-
exec 3>&-

```
an example Bash script that takes a URL as input, uses telnet to connect to the server, and then sends a GET request to retrieve the HTTP headers.
We use read to get the URL from the user input.
We extract the host and port from the URL using awk.
We use exec to open a bidirectional connection to the host using telnet, and send a GET request with the appropriate HTTP headers.
We use a while loop to read the response headers from the telnet output line by line and print them to the console.
We use exec again to close the telnet connection.

Note that this script assumes that the URL is valid and contains both the protocol (e.g., http:// or https://) and the path to the resource (e.g., /index.html). If the URL is incomplete or malformed, the script may not work as expected.

---
### updates.sh
**Code:**

```Bash
#!/bin/bash

sudo dnf update
sudo dnf upgrade

```

Bash script that uses the sudo command to run the dnf update and dnf upgrade commands. These commands are specific to Linux distributions that use the DNF package manager, such as Fedora.

The purpose of the script is to update and upgrade the installed packages on the system. The dnf update command updates the packages to their latest versions, while the dnf upgrade command upgrades the installed packages to newer versions if available.

Running these commands with sudo gives them elevated privileges, allowing them to make system-level changes. It's important to exercise caution when using sudo as it grants significant control over the system, and unnecessary or incorrect commands can cause unintended consequences.


