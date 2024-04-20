#!/bin/sh

# docker
alias docker='nerdctl.lima'
alias d='/usr/local/bin/nerdctl.lima'

# kubernetes
alias k='kubectl'

# Misc
alias rm='trash'
alias ll='ls -ltr'
alias la='ls -la'
alias hg='history | grep'
alias p='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass clip'

# Git (borrowed from https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh)
alias gl='git pull'
alias gp='git push'
alias gaa='git add --all'
alias ga='git add'
alias gba='git branch -a'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gss='git status -s'
alias gst='git status'
alias lg='lazygit'

# nix programs
alias figlet='nix run "nixpkgs#figlet"'
