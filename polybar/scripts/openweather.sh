#!/bin/sh
# polybar weather module, powered by openweather

force() {	ps -p $SLEEP_PID >/dev/null && kill $SLEEP_PID; }
trap force USR1

CACHE="$POLYBAR_RUN/openweather"

out() { echo " $@"; }
out_info() { echo "$data_icon $data_feel°C  $data_humid%"; }

wait_online() {
	out ..\?
	for delay in $(seq 2 4 30); do
		ping -c1 archlinux.org >/dev/null 2>&1 && break
		sleep $delay
	done
}

read_config() {
	. .priv/openweather.conf
	if [ -z "$conf_apikey" ] || [ -z "conf_cityid" ]; then
		echo "err: missing config"
		exit 1
	fi
}

icon() {
	case "$1" in
	01d) echo ;; #Clear
	01n) echo ;; #Clear night
	02?|03?|04?) echo ;; #Clouds
	09?) echo ;; #Shower
	10?) echo ;; #Heavy rain
	11?) echo ;; #Thunderstorm
	13?) echo ;; #Snow
	50?) echo ;; #Fog
	*)   echo ;; #Unknown
	esac
}

download_json() {
	curl -s "https://api.openweathermap.org/data/2.5/weather?\
appid=$conf_apikey&id=$conf_cityid&units=metric"
} >"$CACHE"

parse_json() {
	<"$CACHE" jq -r '.cod, (.main|.temp, .feels_like, .humidity), (.weather[0]|.description, .icon)'|\
	for var in data_cod data_temp data_feel data_humid data_desc data_icon; do
		read data
		printf $var=
		case $var in
		data_temp|data_feel) echo "($data+.5)/1"|bc;;
		data_desc) echo \'$data\'|sed -E 's/\b(.*)/\u\1/g';;
		data_icon) icon $data;;
		*) echo $data;;
		esac
	done
}

is_valid() { [ "$data_cod" = 200 ]; }

get_info() {
	wait_online
	out ...
	[ -f "$CACHE" ] || download_json
	eval $(parse_json)
	is_valid && out_info || echo
}

read_config
while true; do
	get_info
	rm -f "$CACHE"

	sleep 1h & SLEEP_PID=$!
	wait
done
