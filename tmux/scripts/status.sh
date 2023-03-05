#!/bin/sh
# white
bgw='#[bg=brightwhite]'
fgw='#[fg=brightwhite]'
# black
bg233='#[bg=color233]'
fg233='#[fg=color233]'
fgb='#[fg=black]'


datetime() {
	local format=%-H:%M:%S
	date +"$format"
}

temp() {
	local file=/sys/class/thermal/thermal_zone1/temp
	[ -r "$XDG_CONFIG_HOME/cputemp" ] && file=$(cat "$XDG_CONFIG_HOME/cputemp")
	cat "$file"|awk '{print $1/1000}'
}

cpu_raw() { grep 'cpu ' /proc/stat; }
cpu() {
	local i=$(cpu_raw; sleep .2s; cpu_raw)
	echo "$i" |\
		awk '{u=$2+$4; t=$2+$4+$5; if (NR==1) {u1=u; t1=t;} else printf("C  %d%%", ($2+$4-u1)*100/(t-t1)+.5); }'
}

mem() { free|awk 'NR==2 {printf("M  %d%%", ($2-$7)/$2*100+.5)}'; }

battery() {
	local bat=$(acpi -b 2>/dev/null)
	[ -z "$bat" ] && return
	acpi -a|grep -q "on-line" && printf %s "↑ "
	acpi -b|grep -Eo "[0-9]+%"
}

status() {
	for cmd in $@; do
		local out=$(eval "$cmd")
		[ -z "$out" ] && continue
		printf %s "$bg233$fgw$bgw$fgb $out$fg233"
		[ "$cmd" = datetime ] && printf ' ' || printf ' '
	done
}

if [ -z "$DISPLAY" ]; then
	status temp cpu mem
fi
status battery datetime
echo # Flush tmux buffer
