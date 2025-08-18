for package in $(pacman -Qe); do
	echo $(pacman -Qi "$package" | grep "Installed Size")
done
