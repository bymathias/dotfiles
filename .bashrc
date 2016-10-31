#!/bin/bash
# shellcheck source=/dev/null


DOT_B="$HOME/.dotfiles/bash"

# Main .bashrc config
for file in config colors prompt paths; do
  . "$DOT_B/$file"
done

# Aliases/Functions
for file in .aliases .functions; do
  [[ -f $DOT_B/$file ]] && . "$DOT_B/$file"
done

# OS specific aliases
case "$SYSTEM" in
  "Linux") [[ -f $DOT_B/.aliases_linux ]] && . "$DOT_B/.aliases_linux" ;;
  "Darwin") [[ -f $DOT_B/.aliases_macos ]] && . "$DOT_B/.aliases_macos" ;;
esac

# Completions for macos
if [[ "$SYSTEM" == "Darwin" ]]; then
  test -e "$(brew --prefix)/etc/bash_completion" && . "$(brew --prefix)/etc/bash_completion"
  test -e "$HOME/.iterm2_shell_integration.bash" && . "$HOME/.iterm2_shell_integration.bash"
fi

# Node Version Manager
[[ -s $HOME/.nvm/nvm.sh ]] && . "$HOME/.nvm/nvm.sh"
[[ -r $HOME/.nvm/bash_completion ]] && . "$HOME/.nvm/bash_completion"

# (last) Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
