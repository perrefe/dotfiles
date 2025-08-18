# Function to source files if they exist
function zsh_add_file() {
    if [[ "exports" = ${1[1,7]} || "aliases" = ${1[1,7]} || "plugins" = ${1[1,7]} ]]; then
        [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
    elif [[ "enabled" = ${1[-7,-1]} ]]; then
        [ -f "$1" ] && source "$1"
    elif [[ "manual" = ${1[-6,-1]} ]]; then
        [ -f "$1" ] && source "$1"
    elif [[ "disabled" = ${1[-8,-1]} ]]; then
      echo "Si desea habilitar el script cambie su extension a .enabled o .manual para habilitar via load_*()"
    else
      [ -f "$1" ] && source "$1"
    fi
}

function zsh_add_dir() {
  for s in $ZDOTDIR/${1}/*.enabled; do
    zsh_add_file $s
  done
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

function zsh_add_completion() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For completions
		completion_file_path=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
		fpath+="$(dirname "${completion_file_path}")"
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
		fpath+=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
        [ -f $ZDOTDIR/.zccompdump ] && $ZDOTDIR/.zccompdump
    fi
	completion_file="$(basename "${completion_file_path}")"
	if [ "$2" = true ] && compinit "${completion_file:1}"
}

# Source loaders
function load_nvm() {
  zsh_add_file "sources/nvm.manual"
}
function load_pyenv() {
  zsh_add_file "sources/pyenv.manual"
}
function load_rvm() {
  zsh_add_file "sources/rvm.manual"
}
function load_sdkman() {
  zsh_add_file "$HOME/.sdkman/bin/sdkman-init.sh"
}
