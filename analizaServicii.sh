#!/bin/bash


if [[ -f logServicii.txt ]] 
then
	sudo rm logServicii.txt
fi

users=$(users)

serviciiActive=$(sudo systemctl list-units -t service --state=active | tail -n +2 | head -n -5 | cut -d' ' -f3 | tr "\n" " ")
serviciiInactive=$(sudo systemctl list-units -t service --state=inactive | tail -n +2 | head -n -5 | grep "loaded" | cut -d' ' -f3 | tr "\n" " ")

for i in $users
do
	for j in $serviciiActive
	do
		var=$(sudo systemctl status $j | egrep -o -m 1 $i)
		if [[ $var == $i ]]
		then
			echo Utilizatorul $i are pornit serviciul $j >> logServicii.txt
		fi
	done
	for j in $serviciiInactive
	do
		var=$(sudo systemctl status $j | egrep -o -m 1 $i)
		if [[ $var == $i ]]
		then
			echo Utilizatorul $i are oprit serviciul $j >> logServicii.txt
		fi
	done
done
