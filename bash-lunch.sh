#!/bin/bash

# Goals here are:
#  - Clean out email
#  - close out tabs

source timed-functions.sh

echo "email; close p2 tabs; kill tabs"

echo "Email"
open https://inbox.google.com/u/0/
osascript -e 'activate application "Google Chrome"'
timed_msg "Start five minutes of emptying email." 4 &&
timed_msg "Finish emptying email in three minutes" 1 &&
timed_confirm "Ready to p2?" "p2?" 60

echo "Close Tabs"
timed_msg "Clean out tabs" 15 &&
timed_msg "Finish cleaning out tabs" 5 &&
timed_confirm "Give up and kill tabs?" "killing tabs?" 300
timed_confirm "All tabs killed?" "All tabs killed?" 30
