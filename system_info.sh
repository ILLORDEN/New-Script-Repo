#!/bin/bash

echo " OS VERSION"

if [ -f /etc/os-release ]; then
	cat /etc/os-release
else
	uname -a
fi

echo " USERS WITH BASH SHELL"

awk -F: '$7 ~ /bash$/ { print $1 }' /etc/passwd

echo " OPEN (LISTENING) PORTS"

if command -v ss >/dev/null 2>&1; then
	ss -tuln
elif command -v netstat >/dev/null 2>&1; then
	netstat -tuln
else
	echo "Neither ss nor netstat is available."
fi
