#!/bin/bash

# Goals here are:
#  - leave some easy code to start on in the morning
#  - close out tabs
#  - journal
#  - clean up email
#  - gtd

source timed-functions.sh

echo "gtd; close p2 tabs; prep coding;"

echo "GTD"
osascript -e 'activate application "emacs"'
timed_msg "Start two minutes of gtd" 2 &&
timed_confirm "Ready for closing tabs?" "tabs?" 120

echo "Close Tabs"
osascript -e 'activate application "Google Chrome"'
timed_msg "Start twenty minutes of closing all tabs." 15 &&
timed_msg "Finish closing tabs in five minutes" 5 &&
timed_confirm "Ready to prep coding?" "coding?" 60

echo "Coding Prep"
osascript -e 'activate application "emacs"'
timed_msg "Find a broken test or start broken code to fix tomorrow" 4 &&
timed_confirm "Ready to code tomorrow?" "done?" 300
