#!/bin/bash


users=$(users)

for i in $users
do
	echo Serviciile pornite ale utilizatorului $i: >> logServicii.txt
	sudo -u $i systemctl -t service --state=running >> logServicii.txt
	echo Serviciile oprite ale utilizatorului $i: >> logServicii.txt
	sudo -u $i systemctl -t service --state=inactive >> logServicii.txt
done
