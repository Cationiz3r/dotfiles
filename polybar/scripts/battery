#!/bin/sh

get_state()  { acpi -a|grep -q 'on-line'; }
get_charge() { acpi -b|grep -Eo '[0-9]+%'|head -c-2; }

is_low() { [ $(get_charge) -le 20 ]; }
is_full() { [ $(get_charge) -ge 95 ]; }

get_info() {
	local charge icon=
	get_state && icon=
	is_low && ! get_state && printf "%s" "$DANGER" # Bold red
	is_full || charge=" $(get_charge)" # Hide number
	echo "$icon$charge"
}

while true; do
	get_info

	sleep 1
done
