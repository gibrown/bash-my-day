#!/bin/bash

# $1 string
function i_do_say() {
	osascript -e "display notification \"$*\" with title \"Do It\""
	say --rate 250 $*
}

# $1 : Activity string
# $2 : Time
function timed_msg() {
	i_do_say $1
	read -t "$(($2 * 60))"
	if [ $? -ne 0 ]; then
		return 0
	else
		return 1
	fi
}

# $1 : Next Activity String
# $2 : Reminder String
# $3 : Time in seconds
function timed_confirm() {
	i_do_say $1
	delay=$3
	cnt=0
	while true; do
		read -n 1 -t $delay -p "$delay seconds: 'd' to delay 5 min or any key to continue" varkey
		if [ $? -ne 0 ]; then
			echo
			i_do_say $2
			cnt=$((cnt+1))
			if [[ "$cnt" -gt 20 ]]; then
				cnt=0
				i_do_say 'Are you paying attention? Time to start a different script?'
			fi
		elif [ "d" == "$varkey" ]; then
			varkey=''
			delay="$(($delay + 300))"
			echo
			echo "Delaying 5 min"
		else
			echo
			break
		fi
done
}


export -f timed_confirm
export -f timed_msg
