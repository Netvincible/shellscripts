n=1
while [ $n -eq 1 ]
do
	x=$(free -h | grep free -v --max-count=1)
	y=$(echo "${x:38:-38}")

	if [ $y -lt 100 ]
	then
		notify-send --urgency=critical  "RAM ALERT" "RAM Consumption Exceeded 90%"
		sleep 7
	fi
	sleep 3
done
