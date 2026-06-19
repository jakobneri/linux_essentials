# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -lah'
alias la='ls -A'

# Tools
alias ,='btop'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Tmux
t() {
  case "$1" in
    ls) tmux ls ;;
    ks) tmux kill-session ;;
    n)  tmux new-session -s "$2" ;;
    *)  tmux attach 2>/dev/null || tmux new-session ;;
  esac
}
