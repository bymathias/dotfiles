#!/usr/bin/env bash

set -euo pipefail


directory="$HOME/.dotfiles"
symlinks=(bashrc bash_profile vim vimrc editorconfig gitconfig curlrc wgetrc tmux.conf)

gitconfig=(user.name user.email github.user)
repository="https://github.com/bymathias/dotfiles"

extbackup="$(date +'%Y-%m-%d').backup"

# ================================================ #
#   Helper functions
# ================================================ #

# Check if the command exists
_cmd() {
  command -v "$1" > /dev/null 2>&1 \
    && return 0 \
    || return 1
}

# Check if this is a desktop environment
_desktop() {
  [[ -n $DESKTOP_SESSION ]] \
    && return 0 \
    || return 1
}

# Check the owner of the git repository
_dotfiles() {
  command grep -R "$1" "$directory/.git/config" > /dev/null 2>&1 \
    && return 0 \
    || return 1
}

# Remove symlinks and move files/directories
_remove() {
  if [ -h "$1" ]; then
    rm -v "$1"
  elif [ -f "$1" ] || [ -d "$1" ]; then
    mv -v "$1" "$1.$extbackup"
  fi
}

# Remove symlink if any and create a new symlink
_symlink() {
  _remove "$2" \
    && ln -sv "$1" "$2"
}

# Use git, curl or wget to download repository
_download() {
  declare url=$1 dir=$2
  local cmd

  if [[ -d "$dir" ]]; then
    echo "'$dir' directory already exists"

    echo "Would you like to remove it (backup -> '$dir.$extbackup') ? (y/n): "
    read -n 1 -t 10
    REPLY=${REPLY:-y}
    echo ""

    [[ "$REPLY" =~ ^[Yy]$ ]] && _remove "$dir" || return 1
  fi

  if _cmd "git"; then
    command git clone --depth 1 "$url.git" "$dir"
    return 0
  elif _cmd "curl"; then
    cmd="curl -#L"
  elif _cmd "wget"; then
    cmd="wget --no-check-certificate -O -"
  fi

  if [ -n "$cmd" ]; then
    command mkdir -p "$dir"
    command $cmd "$url/tarball/master" \
      | tar -xzv -C $dir --strip-components=1 --exclude='{.gitignore}' > /dev/null 2>&1
  else
    echo "No git, curl or wget available. Aborting."
    exit 1
  fi
}

_gitconfig() {
  local info
  info=$(git config --global --get "$1" || echo "")

  if [ -z "$info" ]; then
    echo "Enter your git \"$1\": "
    read -r -t 10 ans
    info=$ans
  fi

  git config --file "$directory/gitconfig" --replace-all "$1" "$info"
}

# ================================================ #
#   Main function
# ================================================ #

_bootstrap() {
  if [ $# -ne 1 ]; then
    _bootstrap help
    return
  fi

  case "$1" in
    "install"|"i")

      if _dotfiles "bymathias"; then
        (cd $directory && command git pull origin master)
      else
        _download "$repository" "$directory"
      fi

      for i in "${gitconfig[@]}"; do
        _gitconfig "$i"
      done

      for i in "${symlinks[@]}"; do
        _symlink "$directory/$i" "$HOME/.$i"
      done

      vim +PlugInstall +qall

      if _desktop; then
        if _cmd "terminator"; then
          _symlink "$directory/config/terminator/terminator.config" "$HOME/.config/terminator/config"
        fi
        if _cmd "conky"; then
          _symlink "$directory/config/conky/conkyrc" "$HOME/.conkyrc"
        fi
      fi

      ;;
    "remove"|"r")

      for i in "${symlinks[@]}"; do
        _remove "$HOME/.$i"
      done

      if _desktop; then
        local desktop_symlinks=("$HOME/.config/terminator/config" "$HOME/.conkyrc")

        for i in "${desktop_symlinks}"; do
          _remove "$i"
        done
      fi

      _remove "$directory"

      ;;
    "update"|"u")

      vim +PlugClean! +PlugUpgrade +PlugUpdate +qall

      ;;
    "help"|*)

      echo "Usage:"
      echo -e "\t./bootstrap.sh [ install | uninstall | update | help ]"

      ;;
  esac
}

time { _bootstrap "$@"; }
