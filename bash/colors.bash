#!/usr/bin/env bash
# shellcheck disable=SC2034

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # Reset colors
	tput sgr0

	bold=$(tput bold)
	reset=$(tput sgr0)

	black=$(tput setaf 234)
	blue=$(tput setaf 27)
	cyan=$(tput setaf 238)
	green=$(tput setaf 65)
	orange=$(tput setaf 166)
	purple=$(tput setaf 90)
	red=$(tput setaf 203)
	white=$(tput setaf 252)
	yellow=$(tput setaf 186)
else
  # Reset colors
	reset="\e[0m"

	bold=""

	black="\e[0;30m"
	blue="\e[0;34m"
	cyan="\e[0;36m"
	green="\e[0;32m"
	orange="\e[0;33m"
	purple="\e[0;35m"
	red="\e[0;31m"
	white="\e[0;37m"
	yellow="\e[0;33m"
fi
