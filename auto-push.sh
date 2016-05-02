 #!/bin/sh

cd ~/Developer/GitHub/Cron-Auto-Push

date_var="$(date)"
date_var="${date_var// /-}" #replaces all spaces with dashes
filepath="log/$date_var.log"
day="${filepath:0:14}" #gets the first 10 characters of string

containsLogFromToday=0

add_commit_push()
{
	echo "-------ADD COMMENTS-------" >> $filepath
	git add * >> "$filepath"
	echo "-------COMMIT COMMENTS-------" >> "$filepath"
    git commit -a -m "Auto-commit at $date_var" >> "$filepath"
	echo "-------PUSH COMMENTS-------" >> "$filepath"
    git push -u origin master >> "$filepath"
	echo "success!"
}



if [[ $1 == "-o" ]]; then
	add_commit_push
	exit 1
fi

check_for_auto_commit()
{
	for filename in log/*.log; do
		fileday=${filename:0:14}
		if [[ $fileday == $day ]] && [[ $1 != "-o" ]]; then # $1 is the first command-line argument, like sys.argv[1] in python
			echo "Already auto-committed today"
			containsLogFromToday=1
			break
    	fi
	done
}
 

if [ $containsLogFromToday == 0 ]; then
	add_commit_push
fi


