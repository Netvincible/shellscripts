a=10
while [ $a -ge 0 ];
do
	if [ $a -eq 0 ];
	then
		if [ $(ls -a | grep -c ".git") -eq 0 ];
		then
			echo "Initiating git"
			git init
		fi

		remote_name=$(git remote -v | awk '{print $1;exit}')
		if [ -z "$remote_name" ];
		then
			echo "No existing remote urls found"
			url=""
			read -p "enter git url: " url
			read -p "enter remote name: " remote_name
			git remote add $remote_name $url
		else
			echo "remote url already exists:"
			echo "$(git remote -v)"
		fi
		echo "Fetching all existing branches from remote"
		git fetch $remote_name
		echo "Switching to branch main "
		git checkout main
		echo "updating main with $remote/main"
		git pull
		
	elif [ $a -eq 1 ];
	then
		file="."
		read -p "enter file name(enter "." if you want to push everything)): " file
		git add $file
		message=""
		read -p "enter commit message: " message
		git commit -m $message
		
	elif [ $a -eq 2 ];
	then	
		echo "current branches: "
		echo "$(git branch)"
		branch=""
		read -p "enter branch to push: " branch
		git push -u $remote_name $branch
	elif [ $a -eq 3 ];
	then
		files=""
		read -p "enter files to stash (separated by space): " files
		git add $files
		msg=""
		read -p "enter message for stash: " msg
		git stash -m "$msg"
	else
		echo "invalid option try again..."
	fi
	echo "Menu"
	echo "0. git setup"
	echo "1. commit to local"
	echo "2. push to remote"
	echo "3. stash"
	echo "-1 for exit"
	read -p "your choice: " a
done
