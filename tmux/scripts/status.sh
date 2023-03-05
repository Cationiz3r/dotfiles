#!/bin/sh

datetime() {
	# Print time, this is also the final component, so
	# a space is added
	printf ' #[bg=brightwhite,fg=black]'
	local time=$(date '+%-H:%M:%S')
	printf " $time "
}

temp() {
	local file=/sys/class/thermal/thermal_zone1/temp
	[ -r "$XDG_CONFIG_HOME/cputemp" ] && file=$(cat "$XDG_CONFIG_HOME/cputemp")
	local degree=$(cat "$file"|awk '{print $1/1000}')
	printf "$degree°C"
}

sum() {
	# Calculate sum of numbers separated by space
	local select="$1"
	cut -d' ' -f"$select"|tr ' ' +|bc
}
round() {
	# Round result using bc & cut
	echo "$1+.5"|bc -l|cut -d. -f1
}

cpu_raw() {
	# Read from /proc and parse the used/total amount
	local data=$(head -1 /proc/stat|cut -b6-)
	used=$(echo "$data"|sum 1,3)
	total=$(echo "$data"|sum 1,3,4)
	echo "$used $total"
}
cpu_read() {
	# Read raw data twice with delay between
	cpu_raw
	sleep .2
	cpu_raw
}
cpu() {
	eval set -- $(cpu_read)
	local usage=$(round "($3-$1)*100/($4-$2)")
	printf "c.$usage"
}

mem() {
	## Parse RAM usage from command free
	local raw_read=$(free|grep '^Mem:')
	# Parse into array
	eval set -- $raw_read
	local usage=$(round "($2-$7)*100/$2")
	printf "m.$usage"
}

battery() {
	## Print battery state & percentage
	# Exit if no battery is detected
	local bat=$(acpi -b 2>/dev/null)
	[ -z "$bat" ] && return

	# Parse state into icon
	acpi -a|grep -q "on-line" && local icon="↑ "

	# Percentage
	local percentage=$(acpi -b|grep -Eo "[0-9]+%"|head -c-2)
	printf "$icon$percentage"
}

sep() {
	printf '#[fg=black] \ #[default]'
}

sys_info() {
	[ -n "$DISPLAY" ] && return
	cpu
	printf ' ' # space separator
	temp
	sep
	mem
}

non_datetime() {
	# bro??
	local a=$(sys_info)
	local b=$(battery)
	printf "$a"
	[ -n "$a" ] && [ -n "$b" ] && sep
	printf "$b"
}

status() {
	# Get non_datetime modules
	local others=$(non_datetime)

	# Begin
	if [ -n "$others" ]; then
		printf '#[fg=brightblack]#[default]' # triangle
		printf '#[bg=brightblack]#[push-default] ' # set style
		printf "$others"
	fi

	datetime

	# End
	printf '#[pop-default]'
	echo
}
status
