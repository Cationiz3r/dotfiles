#!/bin/zsh
#	           _
#	   _______| |__   ___ _ ____   __
#	  |_  / __| '_ \ / _ \ '_ \ \ / /
#	 _ / /\__ \ | | |  __/ | | \ V /
#	(_)___|___/_| |_|\___|_| |_|\_/
#

# Rust mod keyword to source submodules
_MOD_SOURCE_ROOT="$ZDOTDIR"
_MOD_IS_ROOT=true
mod() {
	local _name="$1"
	if [ -z "$_MOD_IS_ROOT" ]; then
		echo "warn: module $_name.zsh should be sourced from \
$_MOD_SOURCE_ROOT.mod" >&2
	elif [ -f "$_MOD_SOURCE_ROOT/$_name.zsh" ]; then
		local root="$_MOD_SOURCE_ROOT"
		_MOD_IS_ROOT=
		source "$_MOD_SOURCE_ROOT/$_name.zsh"
		_MOD_IS_ROOT=true
	elif [ -f "$_MOD_SOURCE_ROOT/$_name/mod.zsh" ]; then
		_MOD_SOURCE_ROOT="$_MOD_SOURCE_ROOT/$_name"
		source "$_MOD_SOURCE_ROOT/mod.zsh"
		_MOD_SOURCE_ROOT=$(dirname "$_MOD_SOURCE_ROOT")
	else
		local _base=$(basename "$_name")
		echo "warn: $_base.zsh and $_base/mod.zsh do not exist in \
$_MOD_SOURCE_ROOT" >&2
	fi
}

typeset -U path PATH
mod environment
