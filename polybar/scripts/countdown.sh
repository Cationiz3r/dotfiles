#!/bin/sh
schel=/run/systemd/shutdown/scheduled
[ -f $schel ] || { echo; exit; }
date -u --date=@$(($(cat $schel|head -1|cut -d= -f2|head -c-7)-$(date +%s))) +%H:%M:%S|sed -E 's/^(00:)*0?//'
