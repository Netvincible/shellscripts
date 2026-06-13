LC_ALL=C pacman -Qei | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -hr
