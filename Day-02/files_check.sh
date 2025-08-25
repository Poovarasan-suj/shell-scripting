#!/bin/bash

file="test.txt"

if [ -f $file ]
then 
	  echo "file is exists"
else
	echo"file is not exists"
fi
