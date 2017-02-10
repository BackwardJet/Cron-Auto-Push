# Cron-Auto-Push
A script to automate pushing to Github

# Installation:
* <h3>Automated: </h3>
    1. Run the following command:
        - `bash setup.sh -o` OR
        - `./setup.sh` if permissions are set correclty
    2. Fill out the information that the script will prompt you for.
        - Here is a screenshot of the information that I would fill out for this repository:
        - ![Screenshot Cron-Auto-Push User Info Example](http://tej-vuligonda.tk/public/img/Screenshot-CronAutoPush-User-Info-Example.png)
    3. In the future, the setup script will input a crontab for you. The workaround for now is to follow steps 3 and 4 in the ***Manual*** section
* <h3>Manual: </h3>
  * Follow these steps to install the script:
    1. Edit lines 3 to 6 in auto-push.sh to the update the relevant variables
    2. Make your script executable by typing the following command:
        - `chmod a+x auto-push.sh`
    3. Fire up a bash shall and type the following command:
        - `crontab -e` 
    4. Input the following line of code to set-up a cron job that runs every minute:
        - `* * * * * ~/path/to/file/auto-push.sh`
        - NOTE: Because the script limits the user to auto-committing once a day and cron jobs do not run when the user's computer is off or asleep, setting up a cron job that runs every minute will only auto-commit once per day but will still check every minute.

    
## Usage:
* To manually run the script, input the following line of code in your bash shell:
    - `bash auto-push.sh -o` OR  
    - `./auto-push.sh -o` if permissions are set correclty
* Otherwise, if the script is installed correctly, it will be run periodically through a cronjob
* <h3>Possible Use Cases: </h3>
    - Although git and Github really should not be used as backup software, one could potentially use this script to periodically back up a directory on their local Unix based system to the Github server
