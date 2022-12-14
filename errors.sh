#!/usr/bin/bash

* Create Error
ls -l /var/kudus

* Write error to a file
ls -l /var/kudus 2 > error.txt

* Throw Error Away
ls -l /var/kudus 3 >/dev/null
