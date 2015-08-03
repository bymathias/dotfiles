#!/bin/bash


DOT_B=$HOME/.dotfiles/bash              

## Main .bashrc

for file in config colors prompt paths
do
    . "$DOT_B/$file"
done

## Aliases/Functions

for file in .aliases .functions
do
    [[ -f $DOT_B/$file ]] && . $DOT_B/$file
done

## OS specific aliases

case "$SYSTEM" in
    "Linux") [[ -f $DOT_B/.aliases_nux ]] && . $DOT_B/.aliases_nux ;;
    "Darwin") [[ -f $DOT_B/.aliases_osx ]] && . $DOT_B/.aliases_osx ;;
esac

## Completion

if [[ "$SYSTEM" == "Darwin" ]] && [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

[[ -r $HOME/.nvm/bash_completion ]] && . $HOME/.nvm/bash_completion

# added by travis gem
[ -f /Users/bm/.travis/travis.sh ] && source /Users/bm/.travis/travis.sh
