#!/usr/bin/env bash
# shellcheck source=/dev/null
#
# Install, update and remove .dotfiles
# url: https://github.com/bymathias/dotfiles
#
set -euo pipefail

DOT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOT_BACKUP="$(date +'%Y-%m-%d').backup"
declare -a DOT_SYMLINKS

DOT_FOLDERS=("tmux")

mapfile -t DOT_FILES < <(
    find "$DOT_HOME" -maxdepth 1 -type f -name '.*' \
        -not -name '.gitignore' \
        -exec basename {} \;
    )

mapfile -t DIR_CONFIG < <(
    find "$DOT_HOME/config" -maxdepth 1 -type d -not -path "$DOT_HOME/config" \
        -exec sh -c 'echo "config/$(basename "$1")"' _ {} \;
    )

DOT_SYMLINKS+=("${DOT_FILES[@]}" "${DOT_FOLDERS[@]}" "${DIR_CONFIG[@]}")

#printf '%s\n' "${DOT_SYMLINKS[@]}"

# ============================================================= #
#   HELPER FUNCTIONS
# ============================================================= #

# Print output underlined
__log_info() {
    printf "[i] \\e[0;4m%s\\e[0m\\n" "$1"
}

# Check if command exists
__cmd() {
  command -v "$1" > /dev/null 2>&1
  return $?
}

# Remove symlink and move/backup files/directories
__move() {
    local path="$1"

    if [[ -h "$path" ]]; then
        rm "$path"
    elif [[ -f "$path" ]] || [[ -d "$path" ]]; then
        mv "$path" "$path.$DOT_BACKUP"
    fi
}

# Symlink files from '~/.dotfiles' to '$HOME'
__symlink() {
    local dist="$HOME/$2"

    __move "$dist" && \
        ln -sv "$DOT_HOME/$1" "$dist"
    }

# ============================================================= #
#   MAIN FUNCTION
# ============================================================= #

__log_info "Symlink .dotfiles"
for file in "${DOT_SYMLINKS[@]}"; do
    [[ "$file" != .* ]] && dist=".$file" || dist="$file"
    __symlink "$file" "$dist"
    unset file dist
done

if __cmd "alacritty"; then
    DIR_ALACRITTY_THEME="$DOT_HOME/config/alacritty/themes"
    __log_info "Install/Update Alacritty themes"
    rm -v "$DIR_ALACRITTY_THEME" && mkdir -p "$DIR_ALACRITTY_THEME"

    for i in latte frappe macchiato mocha; do
        curl -LO \
            --output-dir "$DIR_ALACRITTY_THEME" \
            https://github.com/catppuccin/alacritty/raw/main/catppuccin-${i}.toml
    done
fi

if __cmd "btop"; then
    DIR_BTOP_THEME="$DOT_HOME/config/btop/themes"
    __log_info "Install/Update Btop themes"
    rm -v "$DIR_BTOP_THEME" && mkdir -p "$DIR_BTOP_THEME"

    for i in latte frappe macchiato mocha; do
        curl -LO \
            --output-dir "$DIR_BTOP_THEME" \
            https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_${i}.theme
    done
fi
