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
function load_pyenv() {
  zsh_add_file "sources/pyenv.manual"
}
function load_rvm() {
  zsh_add_file "sources/rvm.manual"
}
function load_sdkman() {
  zsh_add_file "$HOME/.sdkman/bin/sdkman-init.sh"
}

# User Functions
function random() {
  len=$1
  if [ -z $len ]; then len=12; fi
  openssl rand -base64 $len
}

function decode_sts() {
  echo "Encoded message:"
  read message
  aws --profile test-tango sts decode-authorization-message --encoded-message $message --query DecodedMessage --output text | jq '.'
}

function update_tway_hostnames() {
  BASTION_PUBLIC_IP=$(aws --profile tway-dev --region us-east-2 ec2 describe-instances --filters "Name=tag:Name,Values=TwayBastion" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
  APIS_PRIVATE_IP=$(aws --profile tway-dev --region us-east-2 ec2 describe-instances --filters "Name=tag:Name,Values=TwayApiServices" --query 'Reservations[1].Instances[*].PrivateIpAddress' --output text)
  DATA_PRIVATE_IP=$(aws --profile tway-dev --region us-east-2 ec2 describe-instances --filters "Name=tag:Name,Values=TwayDataServices" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)
  sed -i.bak \
    -e "/dev-tway/,/User/s/Hostname.*/Hostname $BASTION_PUBLIC_IP/" \
    -e "/dev-tway-api/,/User/s/Hostname.*/Hostname $APIS_PRIVATE_IP/" \
    -e "/dev-tway-data/,/User/s/Hostname.*/Hostname $DATA_PRIVATE_IP/" \
    ~/.ssh/config
}

function update_tango_ssh_config() {
  INSTANCE_PRIVATE_IP=$(aws --profile test-tango --region us-east-1 ec2 describe-instances --filters Name=tag:Name,Values=test-tangoapp --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text | tail -1)
  sed -i.bak \
    -e "/test-tangoapp/,+1s/Hostname.*/Hostname $INSTANCE_PRIVATE_IP/" \
    ~/.ssh/config
  echo "$INSTANCE_PRIVATE_IP"
}

function update_tango_demo_ssh_config() {
  INSTANCE_PRIVATE_IP=$(aws --profile demo-tango --region us-east-1 ec2 describe-instances --filters Name=tag:Name,Values=demo-tangoapp --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text | tail -1)
  sed -i.bak \
    -e "/demo-tangoapp/,+1s/Hostname.*/Hostname $INSTANCE_PRIVATE_IP/" \
    ~/.ssh/config
  echo "$INSTANCE_PRIVATE_IP"
}

function rgz() {
  cd ~/.config/zsh
  nvim $(rg --line-number . | fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print "+"$2" "$1}')
}

function rgn() {
  cd ~/.config/nvim
  nvim $(rg --line-number . | fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print "+"$2" "$1}')
}

function note() {
  echo "date: $(date)" >> ./README.md
  echo !! >> ./README.md
  echo "" >> ./README.md
}
