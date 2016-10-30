#!/bin/bash
# shellcheck source=/dev/null


DOT_B="$HOME/.dotfiles/bash"

## Main .bashrc config
for file in config colors prompt paths; do
  . "$DOT_B/$file"
done

## Aliases/Functions
for file in .aliases .functions; do
  [[ -f $DOT_B/$file ]] && . "$DOT_B/$file"
done

## OS specific aliases
case "$SYSTEM" in
  "Linux") [[ -f $DOT_B/.aliases_linux ]] && . "$DOT_B/.aliases_linux" ;;
  "Darwin") [[ -f $DOT_B/.aliases_macos ]] && . "$DOT_B/.aliases_macos" ;;
esac

# Completions
if [[ "$SYSTEM" == "Darwin" ]]; then
  test -e "$(brew --prefix)/etc/bash_completion" && . "$(brew --prefix)/etc/bash_completion"
  test -e "$HOME/.iterm2_shell_integration.bash" && . "$HOME/.iterm2_shell_integration.bash"
fi

# Node Version Manager
[[ -r $HOME/.nvm/bash_completion ]] && . "$HOME/.nvm/bash_completion"

# [[ -f $HOME/.travis/travis.sh ]] && . "$HOME/.travis/travis.sh"
