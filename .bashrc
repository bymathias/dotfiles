#!/bin/bash
# shellcheck source=/dev/null
#
# ~/.bashrc

DOT_BASH="$HOME/.dotfiles/bash"

__source_e() {
  [ -r "$1" ] && [ -f "$1" ] && . "$1";
}


# Bash configurations
for i in config colors prompt paths aliases functions; do
  __source_e "$DOT_BASH/$i.bash"
done

case "$OSTYPE" in
  "darwin"*) __source_e "$DOT_BASH/aliases/macos.alias.bash" ;;
  "linux"*) __source_e "$DOT_BASH/aliases/linux.alias.bash" ;;
esac

# Bash completions
if [[ "$OSTYPE" == "darwin"* ]] && command -v brew > /dev/null 2>&1; then
  __source_e "$(brew --prefix)/etc/bash_completion"
else
  __source_e "/etc/bash_completion"
fi

# NVM loads and completions
__source_e "$HOME/.nvm/nvm.sh"
__source_e "$HOME/.nvm/bash_completion"

# NPM completions
if command -v npm > /dev/null 2>&1; then
  __source_e "$DOT_BASH/completions/npm_completion.bash"
fi

# WP-CLI completions
__source_e "$DOT_BASH/completions/wp_completion.bash"

# iTerm2
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  __source_e "$HOME/.dotfiles/term/iTerm/.iterm2_shell_integration.bash"
fi

# (last) Load RVM into a shell session *as a function*
__source_e "$HOME/.rvm/scripts/rvm"
