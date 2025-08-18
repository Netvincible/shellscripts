#!/bin/bash
echo "Enter password"
read pass
sleep 5
if [ $pass == "netra" ]
then
	echo "The password is correct."
else
	echo "The password is incorrect, try again."
fi
