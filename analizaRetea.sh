#!/bin/bash

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

