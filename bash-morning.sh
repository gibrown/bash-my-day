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
		i_do_say 'OK. Play catchup.'
		echo "slack; p2s; gtd; standup; play catchup;"
	;;
	"personal")
		i_do_say 'Personal catchup.'
		echo "play catchup; focus"
	;;
	"resolver")
		i_do_say 'Resolve some issues.'
	;;
	"code")
		i_do_say 'OK. Get coding!'
		echo "review; code;"
	;;
	"livechat")
		echo "slack; p2s; gtd; standup; prep chat; chat;"
	;;
	"normal")
		echo "slack; p2s; gtd; standup; review; code;"
	;;
	*)
		echo "slack; p2s; gtd; standup; review; code;"
	;;
esac

case "$TYPE" in
	"code")
	;;
	"personal")
	;;
	*)
		echo "Ten Minutes Coding"
		osascript -e 'activate application "emacs"'
		timed_msg "Start coding now." 5 &&
		timed_confirm "Are you really coding?" "Start Slack" 600

		echo "Slack"
		osascript -e 'activate application "Slack"'
		timed_msg "Check slack for 7 minutes" 5 &&
		timed_msg "Finish slack in two minutes" 2

		echo "Alerts"
		osascript -e 'tell application "Google Chrome"' -e 'make new window' -e 'activate' -e'end tell'
		open https://mail.google.com/mail/u/1/
		timed_msg "look at e-mail alerts" 3

		echo "P2 notifications"
		open https://elasticsearchp2.wordpress.com/
		osascript -e 'activate application "Google Chrome"'
		timed_msg "Open p2 notifications, but do not read!" 3 &&
		timed_msg "Finish triaging p2s in one minutes" 1
	;;
esac

case "$TYPE" in
	"catchup")
		paws_in_air
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
		open "https://mc.a8c.com/mgs/?ms=p2&q=date%3Alast-month%20author%3Acallgrierson&sort=swarm"

		osascript -e 'activate application "Google Chrome"'
		timed_msg "Go through Swarm and old tabs" 60 &&
		timed_confirm "Done with p2s?" "Done with p2s?" 300

		echo "Catchup p2 and tabs"
		timed_msg "Catchup on p2 tabs" 30 &&
		timed_confirm "Done with p2s?" "Save p2s for later?" 300

	;;
	"personal")
		paws_in_air
		echo "GTD"
		osascript -e 'activate application "emacs"'
		timed_msg "Start ten minutes of gtd. Full review" 8 &&
		timed_msg "Finish gtd in two minutes" 1 &&
		timed_msg "Finish gtd in one minute" 1
		timed_confirm "GTD Done?" "Start cleanup?" 60

		items=(
			"desk cleanup"
			"checkin"
			"delete email"
			"phone and messages"
			"go through mail"
			"email inbox"
		)
		for i in "${items[@]}"
		do
			echo $i
			timed_msg "Start ten minutes of $i" 8 &&
			timed_msg "Finish $i in two minutes" 1 &&
			timed_msg "Finish $i in one minute" 1
			timed_confirm "$i Done?" "Done?" 60
		done

		paws_in_air
		echo "Start"
		osascript -e 'activate application "emacs"'
		timed_msg "Start on GTD" 8
		timed_confirm "Working on GTD?" "Working?" 300

	;;
	"resolver")
		open "https://elasticsearchp2.wordpress.com/"
		open "https://nosaraproject.wordpress.com/"

		osascript -e 'activate application "Google Chrome"'
		timed_msg "Go through unresolved" 60 &&
		timed_confirm "Done with p2s?" "Done with p2s?" 300

		echo "Select a p2 issue to resolve"
		timed_msg "Select an issue to resolve" 5 &&
		timed_confirm "Picked an issue?" "Still looking?" 600
		timed_msg "Start coding now" 5 &&
		timed_confirm "Are you really coding?" "Still coding?" 600
		timed_msg "Code for an hour." 55
	;;
	"livechat")
		echo "Prep live chat."
		timed_confirm "Prep for live chat." "Ready for live chat?" 300

		echo "Live Chat"
		timed_msg "Start chatting now." 5 &&
		timed_confirm "Are you really chatting?" "Still chatting?" 600

		timed_msg "Chat for an hour." 55

		echo "Break from chat."
		timed_confirm "Take a break from chatting." "Taking a break?" 300

		echo "Prep live chat."
		timed_confirm "Prep for live chat." "Ready for live chat?" 300

		echo "Live Chat"
		timed_msg "Start chatting now." 5 &&
		timed_confirm "Are you really chatting?" "Still chatting?" 600

		timed_msg "Chat for an hour." 55
	;;
	*)
		paws_in_air
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

		paws_in_air
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

		if [[ $(date +%u) -eq 5 ]] ; then
			i_do_say --rate 250 'It is friday. Review!'
			paws_in_air

			echo "GTD"
			osascript -e 'activate application "emacs"'
			timed_msg "Start ten minutes of gtd. Full review" 8 &&
			timed_msg "Finish gtd in two minutes" 1 &&
			timed_msg "Finish gtd in one minute" 1
			timed_confirm "GTD Done?" "Start Standup?" 60

			echo "Catchup email"
			open https://mail.google.com/mail/u/1/
			osascript -e 'activate application "Google Chrome"'
			timed_msg "Catchup on e-mail" 10 &&
			timed_confirm "Done with e-mail?" "Done with e-mail?" 300

			echo "Catchup p2 and tabs"
			osascript -e 'activate application "Google Chrome"'
			timed_msg "Catchup on p2 tabs" 30 &&
			timed_confirm "Done with p2s?" "Save p2s for later?" 300
		fi
	;;
esac
