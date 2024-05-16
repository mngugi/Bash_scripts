#!/bin/bash

string_variable = "Hi i have finished typing a research proposal"

echo  $string_variable
echo  "$string_variable"
echo  '$string_variable'
echo  \$string_variable

echo  Enter some text
read string_variable

echo '$string_variable' now equals $string_variable

exit 
