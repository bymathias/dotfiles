#!/usr/bin/env bash
# shellcheck disable=SC2154
#
# Screenshot: https://cl.ly/i10q
# Based on https://github.com/necolas/dotfiles

__git_info()
{
  local s=""
  local branchName=""
  local releaseTag=""

	# Check if the current directory is in a Git repository
  if [ "$(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}")" == "0" ]; then

    # Check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == "false" ]; then

			# Ensure the index is up to date
			git update-index --really-refresh -q &>/dev/null

			# Check for uncommitted changes in the index
			if ! git diff --quiet --ignore-submodules --cached; then
				s+="+"
			fi

			# Check for unstaged changes
			if ! git diff-files --quiet --ignore-submodules --; then
				s+="!"
			fi

			# Check for untracked files
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+="?"
			fi

			# Check for stashed files
			if git rev-parse --verify refs/stash &>/dev/null; then
				s+="$"
			fi

		fi

		# Get the short symbolic ref
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			printf '(unknown)')"

    # Add parenthesis if not null
		[ -n "${s}" ] && s="(${s})"

    # Get annotated tags if any
		releaseTag+="$(git describe --exact-match --tags HEAD 2> /dev/null)"
    [ -n "${releaseTag}" ] && releaseTag=" ${releaseTag}"

		printf "%s" "${1}${branchName}${2}${s}${3}${releaseTag} "
	else
		return
	fi
}

# Prompt string
PS1="\\[\\033]0;\\w\\007\\]" # Set the terminal title to the current working directory
# PS1+="\n"
# PS1+="\[${cyan}\] #"
PS1+="\\[${yellow}\\]\\h" # Host
PS1+="\\[${cyan}\\]:"
PS1+="\\[${green}\\]\\u " # Username
PS1+="\$(__git_info \"\\[$cyan\\]on \\[${red}\\]\" \"\\[${red}\\]\" \"\\[${orange}\\]\")"
PS1+="\\[${cyan}\\]in "
PS1+="\\[${blue}\\]\\w" # Working directory full path
PS1+="\\n"
PS1+="\\[${cyan}\\]$ \\[${reset}\\]"
export PS1

PS2="\\[${cyan}\\]> \\[${reset}\\]"
export PS2
