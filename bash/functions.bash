#!/usr/bin/env bash
# shellcheck disable=SC2164

cdl() {
  cd "$1" && ls -al;
}

mkc() {
  mkdir -p "$1" && cd "$1";
}

cpp() {
  rsync -WavP --human-readable --progress "$1" "$2"
}

new-script() {
  [[ -e "$1" ]] && echo "'$1' already exists" && return
  echo "#!/usr/bin/env bash" > "$1" && \
  chmod a+x "$1" && \
    vim "$1"
}

new-note() {
  local NOTE_FILE="$HOME/Dropbox/sync/note/$1.md"

  [[ -e "$NOTE_FILE" ]] && echo "'$NOTE_FILE' already exists" && return
  command vim "$NOTE_FILE"
}

list_todo() {
  grep \
    --exclude-dir="node_modules" \
    --exclude-dir="bower_components" \
    --color=always \
    -rnw "$1" -e "TODO:"
}

# Override man to colourise output via LESS_TERMCAP_* variables
man() {
  env \
    LESS_TERMCAP_mb="$(printf '\033[1;31m')" \
    LESS_TERMCAP_md="$(printf '\033[1;31m')" \
    LESS_TERMCAP_me="$(printf '\033[0m')" \
    LESS_TERMCAP_se="$(printf '\033[0m')" \
    LESS_TERMCAP_so="$(printf '\033[1;44;33m')" \
    LESS_TERMCAP_ue="$(printf '\033[0m')" \
    LESS_TERMCAP_us="$(printf '\033[1;32m')" \
  man "$@"
}

explain() {
  if [ "$#" -eq 0 ]; then
    while read -rp "Command: " cmd; do
      curl -Gs "https://www.mankier.com/api/explain/?cols=$(tput cols)" --data-urlencode "q=$cmd"
    done
    echo "Bye!"
  elif [ "$#" -eq 1 ]; then
    curl -Gs "https://www.mankier.com/api/explain/?cols=$(tput cols)" --data-urlencode "q=$1"
  else
    echo "Usage"
    echo "explain                  interactive mode."
    echo "explain 'cmd -o | ...'   one quoted command to explain it."
  fi
}
