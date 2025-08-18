alias ll='ls -ltra -G'
alias hg='history | grep'

# Git
alias gt='git status'
alias gl='git pull'
alias gp='git push'
alias glog='git log'
alias gba='git branch --all'
alias gco='git switch'

# User aliases
if [ $(ls "$ZDOTDIR/aliases/user.d" | wc -l) -ne 0 ]; then
    for f in $ZDOTDIR/aliases/user.d/*; do source $f; done
fi
