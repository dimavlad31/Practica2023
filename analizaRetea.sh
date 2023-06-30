#!/bin/bash


if [[ -f logAdreseIP.txt ]]
then
	sudo rm logAdreseIP.txt
fi

if [[ -f logDNS.txt ]]
then
        sudo rm logDNS.txt
fi

if [[ -f logTrafic.txt ]]
then
        sudo rm logTrafic.txt
fi




interfata=$(sudo ip route | grep default | sed -e 's/^.*dev.//' -e 's/.proto.*//')

sudo tshark -i $interfata -a duration:60 | while read line
do
	echo $line | egrep -o "([0-9]?[0-9][0-9]?\.){3}[0-9]?[0-9][0-9]?" >> logAdreseIP.txt
	DNS=$(echo $line | tr -s " " | cut -d' ' -f6)
	if [[ $DNS == "DNS" ]] 
	then
		echo $line >> logDNS.txt
	fi
	echo $line >> logTrafic.txt
done

