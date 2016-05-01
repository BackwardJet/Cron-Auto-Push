 #!/bin/sh

cd ~/Developer/GitHub/Cron-Auto-Push

date_var="$(date)"
date_var="${date_var// /-}" #replaces all spaces with dashes
filepath="log/$date_var.log"
day="${filepath:0:14}" #gets the first 10 characters of string
echo $day
echo $filepath

containsLogFromToday=0

for filename in log/*.log; do
	fileday=${filename:0:14}
	if [ $fileday == $day ]; then
		echo "Already auto-committed today"
		containsLogFromToday=1
		break
    fi
done
 

if [ $containsLogFromToday == 0 ]; then
	git add * >> "$filepath"
	git commit -a -m "Auto-commit at $date_var"
	#git push
	#git push -u origin master
fi
 #git add * >> "$filepath"
 #if [[ $? != 0 ]] then 
 #   mail -s "add failed" someone@some.com
 #   exit 1
 #fi
 
 #git commit -a -m "Auto-commit at $date_var" >> "$filepath"
 #if [[ $? != 0 ]] then 
 #   mail -s "commit failed" someone@some.com
 #   exit 1
 #fi
 
 #git push
 #if [[ $? != 0 ]] then 
 #   mail -s "push failed" someone@some.com
 #   exit 1
 #fi
 
 #mail -s "push ok" someone@some.commail -s "push ok" someone@some.com
