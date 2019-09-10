#!/bin/bash

LOCAL_REPO="/home/localuser"
USERNAME="username"
PASSWORD="password"
REMOTE_REPO="github.com/github_user/repo-name.git"
EMAIL="email@domain.com"

cd $LOCAL_REPO

date_var="$(date)"
date_var="${date_var// /-}" # replaces all spaces with dashes
log_file="log/$date_var.log"
mkdir -p "log" && touch $log_file
day="${log_file:0:14}" # gets the first 10 characters of string

containsLogFromToday=0

add_commit_push()
{
    echo "-------ADD COMMENTS-------" >> $log_file
    git add * >> "$log_file"
    echo "-------COMMIT COMMENTS-------" >> "$log_file"
    git commit -a -m "Auto-commit at $date_var" >> "$log_file"
    echo "-------PUSH COMMENTS-------" >> "$log_file"
    git push -u https://$USERNAME:$PASSWORD@$REMOTE_REPO master >> "$log_file"
    if [[ $? != 0 ]]; then
        echo "Body" | mail -s "push failed" $EMAIL
        echo "push failed"
        exit 1
    fi
    echo "success!"
}


check_for_auto_commit()
{
    for filename in log/*.log; do
        fileday=${filename:0:14}
        if [[ $fileday == $day ]] && [[ $1 != "-o" ]]; then # $1 is the first command-line argument, like sys.argv[1] in python
            containsLogFromToday=1
            break
        fi
    done
}

if [[ $1 == "-o" ]]; then
    add_commit_push
    exit 1
else 
    check_for_auto_commit
    if [ $containsLogFromToday == 0 ]; then
        add_commit_push
    fi
fi


