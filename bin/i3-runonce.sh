#!/bin/bash

#set -xv #DEBUG
set -o nounset

if [ $# -lt 2 ]; then
	echo "Usage : "
	echo "$0 [COMMAND] [WORKSPACE]"
	echo "if [COMMAND] is non already running : run it on [WORKSPACE]"
	echo "otherwise focus on [WORKSPACE]"
	echo ""
	echo "Example : "
	echo "$0 firefox 3"
	exit 2
fi

RUNNING=`pgrep $1`

if [ "$RUNNING" ]; then
	i3-msg workspace $2;
else
	i3-msg "workspace \"$2\"; exec $1;"
fi
