#!/bin/sh

killall -q dunst
dunst &
dunstctl rule lockscreen disable
