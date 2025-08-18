#!/bin/bash
remote=$(ps aux | awk '{print $1;exit}')
if [ -z "$remote" ];
then
	echo "true"
fi
