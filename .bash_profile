#!/usr/bin/env bash
#
# ~/.bash_profile
#

# Launch sway automatically after console login, but only on tty1
#if [[ -z $DISPLAY && $(tty) == /dev/tty1 && -z $SWAY_STARTED ]]; then
#    export SWAY_STARTED=1
#    exec sway
#fi

# shellcheck source=/dev/null
[[ -f ~/.bashrc ]] && . ~/.bashrc
