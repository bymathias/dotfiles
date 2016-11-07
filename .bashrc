#!/bin/bash
# shellcheck source=/dev/null

DOT_BASH="$HOME/.dotfiles/bash"

__source_e()
{
  [ -r "$1" ] && [ -f "$1" ] && . "$1";
}

# Main .bashrc config
for i in config colors prompt paths; do
  __source_e "$DOT_BASH/$i"
done

# Aliases/Functions
for i in .aliases .functions; do
  __source_e "$DOT_BASH/$i"
done

# OS specific aliases
case "$(uname -s)" in
  "Linux") __source_e "$DOT_BASH/.aliases-linux" ;;
  "Darwin") __source_e "$DOT_BASH/.aliases-macos" ;;
esac

# Bash completions
if which brew &> /dev/null; then
  __source_e "$(brew --prefix)/etc/bash_completion"
else
  __source_e "/etc/bash_completion"
fi

# iTerm2
__source_e "$HOME/.dotfiles/term/iTerm/.iterm2_shell_integration.bash"

# Node Version Manager
__source_e "$HOME/.nvm/nvm.sh"
__source_e "$HOME/.nvm/bash_completion"

# (last) Load RVM into a shell session *as a function*
__source_e "$HOME/.rvm/scripts/rvm"
