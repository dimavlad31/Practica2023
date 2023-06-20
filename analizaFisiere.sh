#!/bin/bash


users=$(users)

dirs=""

for i in $users
do
	dir=$(cat /etc/passwd | cut -f1,6 -d: | egrep "$i:" | cut -f2 -d:)
	dirs=$dir" "$dirs	
done
 
sudo inotifywait -t 60 -m -r -e create,delete,modify --format '%w%f %e %T' --timefmt '%Y-%m-%d %H:%M:%S' $dirs /bin /etc | while read FILE EVENT TIMESTAMP
do

	if [[ ! $(echo $FILE | egrep "/.cache/|.local|logActivitati.txt|.goutputstream|.config|.bash_history|/.[a-zA-Z0-9]+.swp|subscriptions.conf.[a-zA-Z]|.viminfo.tmp|.viminfo|~$|4913$") ]]
	then
		owner=$(sudo stat -c %U $FILE 2> /dev/null)
		echo $TIMESTAMP $owner  $EVENT $FILE >> logActivitati.txt
	fi
done


