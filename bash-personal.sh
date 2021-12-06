#!/bin/bash

# Goals here are:
#  - feel like I have caught up on p2s and slack, but don't get consumed
#  - set myself up for what to do today by prioritizing first thing
#  - turn off slack
#  - start coding

source timed-functions.sh

i_do_say 'Personal get things done.'
echo "play catchup; focus"

osascript -e 'tell application "Spotify" to play'
paws_in_air

echo "GTD"
osascript -e 'activate application "emacs"'
timed_msg "Start ten minutes of gtd. Full review" 8 &&
timed_msg "Finish gtd in two minutes" 1 &&
timed_msg "Finish gtd in one minute" 1 &&
timed_confirm "GTD Done?" "GTD Done?" 60

items=(
	"high priority personal"
	"rehab review"
	"how review"
	"desk cleanup"
	"delete email"
	"phone and messages"
	"go through mail"
	"email inbox"
	"close tabs"
	"low priority personal"
)
for i in "${items[@]}"
do
	echo $i
	case "$TYPE" in
		"rehab review"|"how review")
			osascript -e 'activate application "emacs"'
		;;
		"close tabs")
			osascript -e 'activate application "emacs"'
		;;
		"delete email"|"email inbox")
			osascript -e 'tell application "Google Chrome"' -e 'make new window' -e 'activate' -e'end tell'
			open https://mail.google.com/mail/u/0/
		;;
		*)
		;;
	esac
	timed_msg "Start ten minutes of $i" 8 &&
	timed_msg "Finish $i in two minutes" 1 &&
	timed_msg "Finish $i in one minute" 1 &&
	timed_confirm "$i Done?" "Done?" 600
done

paws_in_air
echo "Start"
osascript -e 'activate application "emacs"'
timed_msg "Start on GTD" 8
timed_confirm "Working on GTD?" "Working?" 300
