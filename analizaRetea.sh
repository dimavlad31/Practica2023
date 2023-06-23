#!/bin/bash

interfata=$(sudo ip route | grep default | sed -e 's/^.*dev.//' -e 's/.proto.*//')

sudo tshark -i $interfata -a duration:60 | while read -r line
do
	echo $line | egrep -o "([0-9]?[0-9][0-9]?\.){3}[0-9]?[0-9][0-9]?" >> logAdreseIP.txt
	echo $line | egrep "DNS" >> logDNS.txt
	echo $line >> logTrafic.txt
done

