echo "" > list.txt
for package in $(pacman -Qe | awk '{print $1}'); do
	echo "$(pacman -Qi "$package" | grep "Installed Size") : $package" >> list.txt
done
sort -k5,5 -k4,4g list.txt
