# Enter a directory and list files
# usage: `cdl <dirname>`
cdl()
{
  cd "$1" && ls -al;
}

# Change working directory to the top-most 'Finder' window location
# usage: `cdf`
# TODO: with thunar for Debian
cdf()
{
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Create a new directory and enter it
# usage: `mkc <dirname>`
mkc()
{
  mkdir -p "$1" && cd "$1";
}

# Copy w/ progress
# usage: `cpp <inpout> <output>`
cpp()
{
  rsync -WavP --human-readable --progress $1 $2
}

# New script
# usage: `new_script <filename>`
new_script()
{
  [[ -e "$1" ]] && echo "'$1' already exists" && return
  echo "#!/bin/bash" > "$1" && \
  chmod a+x "$1" && \
    vim "$1"
}

# List todos in PWD recursively
# usage: `list-todo <dirname>`
ls_todo()
{
  grep \
    --exclude-dir="node_modules" \
    --exclude-dir="bower_components" \
    --color=always \
    -rnw "$1" -e "TODO:"
}

# Colored man pages with less command
# see: http://bit.ly/IqWXtu
# usage: `man <cmd>`
man()
{
  env \
    LESS_TERMCAP_mb=$(printf "\033[1;31m") \
    LESS_TERMCAP_md=$(printf "\033[1;31m") \
    LESS_TERMCAP_me=$(printf "\033[0m") \
    LESS_TERMCAP_se=$(printf "\033[0m") \
    LESS_TERMCAP_so=$(printf "\033[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\033[0m") \
    LESS_TERMCAP_us=$(printf "\033[1;32m") \
  man "$@"
}
