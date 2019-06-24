#!/bin/bash

# Goals here are:
#  - feel like I have caught up on p2s and slack, but don't get consumed
#  - set myself up for what to do today by prioritizing first thing
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
		echo "slack; p2s; gtd; standup; play catchup;"
	;;
	"code")
		say 'OK. Get coding!'
		echo "review; code;"
	;;
	"normal")
		echo "slack; p2s; gtd; standup; review; code;"
	;;
	*)
		echo "slack; p2s; gtd; standup; review; code;"

		if [[ $(date +%u) -eq 5 ]] ; then
			#It's Friday!
			i_do_say 'It is friday. Catchup!'
			TYPE="catchup"
		fi
	;;
esac

case "$TYPE" in
	"code")
	;;
	*)
		echo "Slack"
		osascript -e 'activate application "Slack"'
		timed_msg "Check slack for 3 minutes" 2 &&
		timed_msg "Finish slack in one minutes" 1

		echo "Alerts"
		osascript -e 'tell application "Google Chrome"' -e 'make new window' -e 'activate' -e'end tell'
		open https://mail.google.com/mail/u/1/
		timed_msg "look at e-mail alerts" 3

		echo "P2 notifications"
		open https://elasticsearchp2.wordpress.com/
		osascript -e 'activate application "Google Chrome"'
		timed_msg "Open p2 notifications, but do not read!" 2 &&
		timed_msg "Finish p2s in one minutes" 1
	;;
esac

case "$TYPE" in
	"catchup")
		echo "GTD"
		osascript -e 'activate application "emacs"'
		timed_msg "Start ten minutes of gtd. Full review" 8 &&
		timed_msg "Finish gtd in two minutes" 1 &&
		timed_msg "Finish gtd in one minute" 1
		timed_confirm "GTD Done?" "Start Standup?" 60

		echo "Standup"
		timed_msg "Write up standup" 2 &&
		timed_confirm "Standup posted?" "coding?" 180

		echo "Catchup email"
		open https://mail.google.com/mail/u/1/
		osascript -e 'activate application "Google Chrome"'
		timed_msg "Catchup on e-mail" 10 &&
		timed_confirm "Done with e-mail?" "Done with e-mail?" 300

		echo "Catchup swarm"
		open "https://mc.a8c.com/mgs/?ms=p2&q=date%3Alast-week&sort=swarm"
		open "https://mc.a8c.com/mgs/?ms=p2&q=date%3Alast-week%20author%3Amatt&sort=swarm"
		open "https://mc.a8c.com/mgs/?ms=p2&q=date%3Alast-week%20author%3Amartinremy&sort=swarm"
		open "https://mc.a8c.com/mgs/?ms=p2&q=date%3Alast-week&sort=score"
		open "https://mc.a8c.com/mgs/?ms=p2&q=date%3Alast-month%20site%3Athursdayupdates.wordpress.com&sort=swarm"
		open "https://mc.a8c.com/mgs/?ms=p2&q=date%3Alast-week%20jetpack&sort=swarm"
		open "https://mc.a8c.com/mgs/?ms=p2&q=date%3Alast-week%20type%3Acomment&sort=swarm"

		osascript -e 'activate application "Google Chrome"'
		timed_msg "Go through Swarm and old tabs" 60 &&
		timed_confirm "Done with p2s?" "Done with p2s?" 300

		echo "Catchup p2 and tabs"
		timed_msg "Catchup on p2 tabs" 30 &&
		timed_confirm "Done with p2s?" "Save p2s for later?" 300

	;;
	*)
		echo "Code Review. Close Slack?"
		timed_confirm "Start code review. Ready to close Slack?" "Close slack and code?" 300
		osascript -e 'quit app "Slack"'

		osascript -e 'activate application "Google Chrome"'
		timed_msg "Review code" 30 &&
		timed_confirm "Done reviewing?" "Done reviewing?" 300

		echo "Coding"
		osascript -e 'activate application "emacs"'
		timed_msg "Start coding now." 5 &&
		timed_confirm "Are you really coding?" "Still coding?" 600

		timed_msg "Code for an hour." 55

		timed_confirm "Ready for notifications?" "Notifications?" 600

		osascript -e 'activate application "Slack"'
		osascript -e 'activate application "Google Chrome"'

		echo "GTD"
		osascript -e 'activate application "emacs"'
		timed_msg "Start five minutes of gtd" 3 &&
		timed_msg "Finish gtd in two minutes" 1 &&
		timed_msg "Finish gtd in one minute" 1

		echo "Standup"
		timed_msg "Write up standup" 2 &&
		timed_confirm "Standup posted?" "coding?" 180

	;;
esac
