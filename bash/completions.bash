#!/usr/bin/env bash
# shellcheck source=/dev/null

# Enable Bash completions
# On Debian: `apt-get install bash-completion`
__source_exists "/etc/bash_completion"

# Enable nvm completions
__source_exists "$HOME/.nvm/bash_completion"

# # Enable NPM completions, if `npm` is installed
if __command_exists npm; then
  source <(npm completion)
fi

# # Enable WP-CLI completions
# __source "$DOT_BASH/completions/wp_completion.bash"
