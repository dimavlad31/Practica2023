#!/bin/bash

interfata=$(sudo ip route | grep default | sed -e 's/^.*dev.//' -e 's/.proto.*//')

ip=$(ip a | egrep $interfata | egrep -o "([0-9]?[0-9][0-9]?\.){3}[0-9]?[0-9][0-9]?/" | sed -r "s/\/$//g")


sudo tcpdump -i $interfata -ne -vv | while read -r line
do
	echo $line | egrep -o "([0-9]?[0-9][0-9]?\.){3}[0-9]?[0-9][0-9]?" >> logAdreseIP.txt
	
done

