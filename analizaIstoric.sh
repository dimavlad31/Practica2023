#!/bin/bash


users=$(users)

for i in $users
do
	echo Comenzile user-ului $i: > istoricComenzi.txt
	homeDir=$(sudo cat /etc/passwd | cut -d: -f1,6 | egrep "$i:" | cut -d: -f2)
	sudo cat $homeDir/.bash_history > istoricComenzi.txt
done
