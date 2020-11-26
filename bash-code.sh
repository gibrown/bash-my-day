#!/bin/bash

# Goals here are:
#  - restart coding
#  - catch up on p2s and slack, but spend very little time on them

source timed-functions.sh

echo "some code review; 10 min code;"

timed_confirm "Start code review. Ready to close Slack?" "Close slack and code?" 300
osascript -e 'quit app "Slack"'

timed_msg "Review code" 30 &&
timed_confirm "Done reviewing?" "Done reviewing?" 300

echo "Coding"
timed_msg "Start ten minutes of coding" 5 &&
timed_confirm "Are you really coding?" "Still coding?" 600
