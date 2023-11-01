#!/bin/sh

## Options
POLYBAR_BATTERY_CRIT=${POLYBAR_BATTERY_CRIT:-20} # Always notify

# Togglable notification
POLYBAR_BATTERY_LOW=${POLYBAR_BATTERY_LOW:-40}
POLYBAR_BATTERY_HIGH=${POLYBAR_BATTERY_HIGH:-80}
POLYBAR_BATTERY_FULL=${POLYBAR_BATTERY_FULL:-95} # Used for icon display

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

while true; do
	get_charge
	get_info

	sleep 5
done
