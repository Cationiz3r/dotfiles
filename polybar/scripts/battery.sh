#!/bin/sh

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
is_low() { [ $CHARGE -le 20 ]; }
is_full() { [ $CHARGE -ge 95 ]; }

get_info() {
	local charge icon=
	is_charge && icon=
	is_low && ! is_charge && printf "%s" "$DANGER" # Bold red
	is_full && is_charge || charge=" $UNKNOWN$CHARGE" # Hide number
	echo "$icon$charge"
}

while true; do
	get_charge
	get_info

	sleep 1
done
