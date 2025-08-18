#[ -z "$ZPROF" ] || zmodload zsh/zprof
# Environment variables
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export ZDOTDIR="$HOME/.config/zsh"

# Functions
#source "$ZDOTDIR/functions/base.zsh"
source "$HOME/.config/zsh/functions/base.zsh"

# fpath
if type brew &>/dev/null; then
  fpath+=$(brew --prefix)/share/zsh/site-functions
fi
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
zsh_add_file "aliases/base.zsh"

# Plugins
# zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "dominik-schwabe/zsh-fnm"
zsh_add_plugin "ptavares/zsh-sdkman"
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
