#!/bin/bash
# Status line derived from ~/.bashrc PS1:
#   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '

input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // empty')
[ -z "$cwd" ] && cwd=$(pwd)

user=$(whoami)
host=$(hostname -s)

chroot=""
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    chroot=$(cat /etc/debian_chroot)
fi

if [ -n "$chroot" ]; then
    printf '(%s)' "$chroot"
fi

printf '\033[01;32m%s@%s\033[00m:\033[01;34m%s\033[00m' "$user" "$host" "$cwd"
