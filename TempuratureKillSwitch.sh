#!/bin/bash

while true;
do
    TEMP=$(sensors -f | grep "Core 0:" | cut -d + -f 2 | cut -d . -f1)
    echo $TEMP
    if [ "$TEMP" -ge 120 ]; then
        echo "$process has been killed" | mailx -s "SUBJECT" user@gmail.com
        killall $daemon
        exit 0
    else
        sleep 2
    fi
done
