#[ -z "$ZPROF" ] || zmodload zsh/zprof
# Environment variables
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Functions
source "$ZDOTDIR/functions/base.zsh"

# fpath
#fpath=(~/.zsh_plugins $(brew --prefix)/share/zsh-completions $fpath)
#fpath=(~/.zsh_plugins $fpath)
fpath+=/usr/local/share/zsh/site-functions
fpath+="$ZDOTDIR/completions/"
fpath+="$ZDOTDIR/plugins/"
# Completions
zmodload zsh/complist
autoload -Uz compinit && compinit -i
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
_comp_options+=(globdots) # Include hidden files

# Source files
zsh_add_dir "sources"
zsh_add_file "exports/base.zsh"
zsh_add_file "exports/custom.zsh"
zsh_add_file "aliases/base.zsh"
zsh_add_file "aliases/custom.zsh"
##zsh_add_file "$HOME/.sdkman/bin/sdkman-init.sh"

# Plugins
# zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-history-substring-search"

# Autosuggestions
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_STRATEGY=(completion)

# History substring search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='(none)'
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down

# Navigate through words with alt
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

#[ -z "$ZPROF" ] || zprof
