#!/bin/bash

webroot="/var/www/html"
webpagegit="https://github.com/lordva/resume.git"

COL_NC='\e[0m' # No Color
COL_LIGHT_GREEN='\e[1;32m'
COL_LIGHT_RED='\e[1;31m'
TICK="[${COL_LIGHT_GREEN}✓${COL_NC}]"
CROSS="[${COL_LIGHT_RED}✗${COL_NC}]"
INFO="[i]"
# shellcheck disable=SC2034
DONE="${COL_LIGHT_GREEN} done!${COL_NC}"
OVER="\\r\\033[K"

is_command(){
	local check_command="$1"
	command -v "${check_command}" >/dev/null 2>&1
}

family_check(){
	if is_command apt-get ; then
		PKG_MANAGER="apt-get"
		UPDATE_CMD="${PKG_MANAGER} update"
		INSTALL_CMD="${PKG_MANAGER} install"
	elif is_command rpm ; then
		if is_command dnf ; then
			PKG_MANAGER="dnf"
			UPDATE_CMD="${PKG_MANAGER} update"
			INSTALL_CMD="${PKG_MANAGER} install"
		else
			PKG_MANAGER="yum"
		fi
	else
		printf " %b Packet manager not supported \\n" "${CROSS}"
		exit
	fi
}

git_install(){
	if is_command git ; then
		printf " %b git is installed \\n" "${TICK}"
	else
		printf " Installing git \\n" "${INFO}"
		if 
}

