# Cron-Auto-Push
A script to push to automate pushing to GitHub

Installation:
* Follow these steps to install the script:
  1. Edit auto-push.sh, line 3 to the path of your project
  2. Make your script executable by typing the following command:
     - `chmod a+x auto-push.sh`
  3. Fire up a bash shall and type the following command:
      - `crontab -e`
  4. Input the following line of code to set-up a cron job that runs every minute:
      - `* * * * * ~/path/to/file/auto-push.sh`
        - NOTE: Because the script limits the user to auto-committing once a day and cron jobs do not run when the user's computer is off or asleep, setting up a cron job that runs every minute will only auto-commit once per day but will still check every minute.
      - Make sure to update "~path/to/file" to the path to your script
    
Usage:
* To manually run the script, input the following line of code in your bash shell:
  - `bash auto-push.sh -o`
