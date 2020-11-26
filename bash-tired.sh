#!/bin/bash

# Goals here are:
#  - feel like I have caught up on p2s and slack, but don't get consumed
#  - set myself up for what to do today by prioritizing first thing
#  - turn off slack
#  - start coding

source timed-functions.sh

paws_in_air

echo "1/10 Code Review"
timed_msg "Start code review?" 5 &&
timed_msg "Review code" 60 &&
timed_confirm "Done reviewing?" "Still reviewing?" 600

echo "2/10 Code main project"
timed_msg "Start coding on main project?" 5 &&
timed_msg "Code" 60 &&
timed_confirm "Done coding?" "Still coding?" 600

echo "3/10 Code greenfield"
timed_msg "Start coding in a green field?" 5 &&
timed_msg "Code" 60 &&
timed_confirm "Done coding?" "Still coding?" 600

echo "4/10 Re-organize Tasks"
timed_msg "Start re-org tasks?" 5 &&
timed_msg "Re-org" 30 &&
timed_confirm "Done Re-org?" "Still Re-org?" 600

echo "5/10 GTD and prep"
timed_msg "Start GTD and prep for coding?" 5 &&
timed_msg "GTD" 30 &&
timed_confirm "Done GTD?" "Still GTD?" 600

echo "6/10 Catchup tabs"
timed_msg "Start going through tabs?" 5 &&
timed_msg "Tabs" 30 &&
timed_confirm "Done with tabs?" "Still reviewing tabs?" 600

echo "7/10 Catchup email"
timed_msg "Start going through email?" 5 &&
timed_msg "email" 30 &&
timed_confirm "Done with email?" "Still reviewing email?" 600

echo "8/10 Write strategy"
timed_msg "Start writing strategy p2?" 5 &&
timed_msg "strategy" 60 &&
timed_confirm "Done with writing?" "Still writing?" 600

echo "9/10 Catchup p2s"
timed_msg "Start going through p2s?" 5 &&
timed_msg "p2s" 60 &&
timed_confirm "Done with p2s?" "Still reviewing p2s?" 600

echo "10/10 Catchup bookmarks"
timed_msg "Start going through bookmarks?" 5 &&
timed_msg "Bookmarks" 30 &&
timed_confirm "Done with bookmarks?" "Still reviewing bookmarks?" 600
