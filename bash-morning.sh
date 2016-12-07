#!/bin/bash

# Goals here are:
#  - feel like I have caught up on p2s and slack, but don't get consumed
#  - set myself up for what to do today by prioritizing first thing
#  - prioritize reviewing other people's code
#  - turn off slack
#  - start coding

source timed-functions.sh

if [ -z "$1" ]; then
	TYPE="default"
else
	TYPE="$1"
fi

case "$TYPE" in
	"catchup")
		say 'OK. Play catchup.'
		echo "slack; p2s; gtd; meditation; journal; standup; play catchup;"
	;;
	"writing")
		say 'Yay! Writing day.'
		echo "slack; p2s; gtd; meditation; journal; standup; writing;"
	;;
	"org")
		say 'Nice, dot org day.'
		echo "slack; p2s; gtd; meditation; journal; standup; review; .org day;"
	;;
	*)
		echo "slack; p2s; gtd; meditation; journal; standup; review; code;"

		if [[ $(date +%u) -eq 4 ]] ; then
			#It's Friday!
			i_do_say 'Are you sure you can not write or do dot org work today?'
		fi
	;;
esac

echo "Slack"
osascript -e 'activate application "Slack"'
timed_msg "Start five minutes of slack and IRC" 3 &&
timed_msg "Finish slack and IRC in two minutes" 2 &&
timed_confirm "Ready for alerts?" "Does today look like a catch up morning?" 180

echo "Alerts"
open https://inbox.google.com/u/0/
osascript -e 'activate application "Google Chrome"'
timed_msg "look at e-mail alerts" 2 &&
timed_confirm "Done with alerts?" "Does today look like a catch up morning?" 300

echo "P2s"
osascript -e 'activate application "Google Chrome"'
timed_msg "Start five minutes of p2s, but do not read 90% now." 3 &&
timed_msg "Finish p2s in five minutes" 2 &&
timed_confirm "Ready for gtd?" "do not respond now. GTD it" 180

echo "Calendar"
open https://calendar.google.com/calendar/b/1/render#main_7
osascript -e 'activate application "Google Chrome"'
timed_msg "Verify Calendar. Anything that needs scheduling?" 1 &&
timed_confirm "Make phone calls now?" "gtd?" 180

echo "GTD"
osascript -e 'activate application "emacs"'
timed_msg "Start five minutes of gtd" 4 &&
timed_msg "Finish gtd in one minute" 1 &&
timed_confirm "Ready for meditation?" 120

echo "Meditation"
timed_msg "Start meditation in one minute" 1 &&
timed_msg "Start meditation" 10 &&
timed_msg "Finish" 1 &&
timed_confirm "Ready for journal?" "journal?" 180

echo "Journal"
osascript -e 'activate application "emacs"'
timed_msg "Start five minutes of journal" 4 &&
timed_msg "Finish journal in one minute" 1 &&
timed_confirm "Ready for standup?" "standup?" 180

echo "Standup"
timed_msg "Writed up standup" 2 &&
timed_confirm "Standup posted?" "coding?" 180

osascript -e 'tell application "iTunes"' -e 'set new_playlist to "Coding" as string' -e "play playlist new_playlist" -e "end tell"

case "$TYPE" in
	"catchup")
		echo "Catchup"
		open https://inbox.google.com/u/0/
		osascript -e 'activate application "Google Chrome"'
		timed_msg "Catchup on e-mail" 10 &&
		timed_confirm "Done with e-mail?" "Done with e-mail?" 300

		timed_msg "Catchup on p2 tabs" 60 &&
		timed_confirm "Done with p2s?" "Done with p2s?" 300
		say 'What is next?'
	;;
	"writing")
		echo "Writing"
		timed_confirm "Start writing. Ready to close Slack?" "Close slack and write?" 300
		osascript -e 'quit app "Slack"'
		osascript -e 'activate application "emacs"'

		timed_msg "Start ten minutes of writing" 5 &&
		timed_confirm "Are you really writing?" "Still writing?" 600
	;;
	"org")
		echo "Coding"
		timed_confirm "Start dot org coding. Ready to close Slack?" "Close slack and code?" 300
		osascript -e 'quit app "Slack"'
		osascript -e 'activate application "emacs"'

		timed_msg "Start ten minutes of .org coding" 5 &&
		timed_confirm "Are you really coding?" "Still coding?" 600
	;;
	*)
		echo "Code Review"
		timed_confirm "Start code review. Ready to close Slack?" "Close slack and code?" 300
		osascript -e 'quit app "Slack"'
		osascript -e 'activate application "emacs"'

		timed_msg "Review code" 30 &&
		timed_confirm "Done reviewing?" "Done reviewing?" 300

		echo "Coding"
		timed_msg "Start ten minutes of coding" 5 &&
		timed_confirm "Are you really coding?" "Still coding?" 600
	;;
esac
