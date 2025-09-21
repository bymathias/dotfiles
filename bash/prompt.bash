#!/usr/bin/env bash

# Default prompt
# PS1='[\u@\h \W]\$ '

# Custom prompt
# Check if git-prompt.sh exists for Git integration
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
    # Enable Git status indicators
    export GIT_PS1_SHOWDIRTYSTATE=1     # * for unstaged, + for staged
    export GIT_PS1_SHOWSTASHSTATE=1     # $ for stashed changes
    export GIT_PS1_SHOWUNTRACKEDFILES=1 # % for untracked files
    export GIT_PS1_SHOWUPSTREAM="auto"  # Show ahead/behind upstream (e.g., >, <, =)

    # Set PS1 based on user (root or non-root)
    if [ "$EUID" -ne 0 ]; then
        # Non-root user (blue username, green hostname, yellow directory)
        PS1=''                        # Initialize PS1
        PS1+='\[\e[34m\]['            # Start with blue opening bracket for username
        PS1+='\u'                     # Add username
        PS1+='@\[\e[32m\]'            # Add @ symbol and switch to green for hostname
        PS1+='\h'                     # Add hostname
        PS1+='\[\e[34m\]]'            # Close bracket in blue
        PS1+='\[\e[m\]:'              # Add colon in default color
        PS1+='\[\e[33m\]\w'           # Add working directory in yellow
        PS1+='\[\e[m\]'               # Reset color
        PS1+='$(__git_ps1 " (%s)")'   # Add Git branch and status (e.g., (main *%))
        PS1+='\n'                     # New line for prompt symbol
        PS1+='\$\[\e[m\] '            # Add $ for non-root user and reset color
    else
        # Root user (red username, green hostname, yellow directory)
        PS1=''                        # Initialize PS1
        PS1+='\[\e[31m\]['            # Start with red opening bracket for username
        PS1+='\u'                     # Add username
        PS1+='@\[\e[32m\]'            # Add @ symbol and switch to green for hostname
        PS1+='\h'                     # Add hostname
        PS1+='\[\e[31m\]]'            # Close bracket in red
        PS1+='\[\e[m\]:'              # Add colon in default color
        PS1+='\[\e[33m\]\w'           # Add working directory in yellow
        PS1+='\[\e[m\]'               # Reset color
        PS1+='$(__git_ps1 " (%s)")'   # Add Git branch and status (e.g., (main *%))
        PS1+='\n'                     # New line for prompt symbol
        PS1+='\#\[\e[m\] '            # Add # for root user and reset color
    fi
else
    # Fallback PS1 without Git info
    if [ "$EUID" -ne 0 ]; then
        PS1='\[\e[34m\][\u@\[\e[32m\]\h\[\e[34m\]]\[\e[m\]:\[\e[33m\]\w\[\e[m\]\n\$\[\e[m\] '
    else
        PS1='\[\e[31m\][\u@\[\e[32m\]\h\[\e[31m\]]\[\e[m\]:\[\e[33m\]\w\[\e[m\]\n\#\[\e[m\] '
    fi
fi
