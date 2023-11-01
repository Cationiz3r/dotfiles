#!/bin/sh

## Options
POLYBAR_BATTERY_CRIT=${POLYBAR_BATTERY_CRIT:-20} # Always notify

# Togglable notification
POLYBAR_BATTERY_LOW=${POLYBAR_BATTERY_LOW:-40}
POLYBAR_BATTERY_HIGH=${POLYBAR_BATTERY_HIGH:-80}
POLYBAR_BATTERY_FULL=${POLYBAR_BATTERY_FULL:-95} # Used for icon display

POLYBAR_BATTERY_NOTIFY="$POLYBAR_RUN/battery"

CHARGE=777
UNKNOWN=true

get_charge() {
	local output=$(acpi -b|grep -Eo '[0-9]+%'|head -c-2) last
	if [ -z "$output" ] || [ "$output" = 0 ]; then
		UNKNOWN="..."
		return 1
	fi
	CHARGE="$output"
	UNKNOWN=
}

is_charge()  { acpi -a|grep -q 'on-line'; }
is_critical() { [ $CHARGE -le $POLYBAR_BATTERY_CRIT ]; }
is_low() { [ $CHARGE -le $POLYBAR_BATTERY_LOW ]; }
is_high() { [ $CHARGE -ge $POLYBAR_BATTERY_HIGH ]; }
is_full() { [ $CHARGE -ge $POLYBAR_BATTERY_FULL ]; }

get_info() {
	local charge icon=
	is_charge && icon=
	is_critical && ! is_charge && printf "%s" "$DANGER" # Bold red
	is_full && is_charge || charge=" $UNKNOWN$CHARGE" # Hide number
	echo "$icon$charge"
}

notify() {
 	dunstify \
		-h string:x-dunst-stack-tag:polybar-battery \
		-u "$1" \
		-t 10000 \
		"$2" "$3"
}

new_notify_state() {
	[ -f "$POLYBAR_BATTERY_NOTIFY" ] || echo 1 > "$POLYBAR_BATTERY_NOTIFY"
}

get_notify_state() {
	new_notify_state
	local state=$(cat "$POLYBAR_BATTERY_NOTIFY")
	return $(( 1 - $state ))
}

toggle_notify_state() {
	get_notify_state
	echo "$?" > "$POLYBAR_BATTERY_NOTIFY"
	local word
	get_notify_state && word='enabled' || word='disabled'
	notify normal 'Battery' "Warnings $word"
}

notify_state() {
	if is_critical && ! is_charge; then
		notify critical 'Battery critical!' 'TIME'
		return
	fi
	get_notify_state || return

	if is_charge && is_full; then
		notify critical 'Battery full!' 'TIME'
	elif is_charge && is_high; then
		notify normal 'Battery high' 'TIME'
	elif ! is_charge && is_low; then
		notify normal 'Battery low' 'TIME'
	fi
}

trap toggle_notify_state USR2

while true; do
	get_charge
	get_info
	notify_state

	sleep 5
done
