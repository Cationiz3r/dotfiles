#!/bin/sh
timedatectl 2>/dev/null|grep synchronized|grep -q yes && echo || echo ' '
