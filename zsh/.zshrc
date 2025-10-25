# SymbolUser=' '
# SymbolHost='🌏🌎🌍🌐   󱘖  󰒍 󰡰   '
# SymbolPath='📂  󰝰 '
# SymbolPrompt='❱  󱞩 󱞪  '
PROMPT="%B%F{green} %n  %F{cyan} %M  %F{yellow} %~%f%b
%F{#919191}󱞪%f "

function include_gitconfig(){
  if (( $# == 0 )); then
    echo requires file path as command argument.
    return 1
  fi
  local CONFIG_FILE=$1  
  [ ! -f "$CONFIG_FILE" ] \
  || git config get --global --all --fixed-value --value="$CONFIG_FILE" include.path > /dev/null 2>&1 \
  || git config set --global --append include.path "$CONFIG_FILE"  
}

include_gitconfig "$HOME/.config/delta/.gitconfig"
include_gitconfig "$HOME/.config/difftastic/.gitconfig"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function lg() {
	export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
	lazygit "$@"
	if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
		cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
		rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
	fi
}

alias su="su --shell=$(which zsh)"
alias myip="curl -Ls ifconfig.me && echo"
alias lj="lazyjournal"
alias ls="ls --color=auto -lhA"
alias lsr="lsr -lA --group-directories-first --hyperlinks=never"
alias cls="clear && tput cup 1024 0"
alias somo="sudo $(which somo) -c"
alias bandwhich="sudo $(which bandwhich)"
alias delta="delta --diff-highlight --line-numbers-minus-style=#E06C75 --line-numbers-plus-style=#98C379"
alias dft-git-log="git dft-log"
alias dft-git-show="git dft-show"
alias dft-git-diff="git dft-diff"

if [ -n "$YAZI_LEVEL" ]; then
    PROMPT=" %F{yellow}[ Yazi Sub Shell ] %F{#919191}%B#%b%f "
    clear
else
    cls
fi

dotfiles_update(){
  DF=$HOME/dotfiles; \
  curl -L -o $DF.tar.gz https://github.com/samyankc/dotfiles/archive/refs/heads/main.tar.gz && \
  \mkdir -p $DF && \
  tar -xf $DF.tar.gz -C $DF --strip-components=1 && \
  \rm -rf $DF.copy && \
  \cp -rf $DF $DF.copy && \
  \ls -d $DF/*/ | xargs -n 1 basename | xargs stow -t $HOME -d $DF --adopt && \
  \rm -rf $DF $DF.tar.gz && \
  \mv -f $DF.copy $DF \
  ;unset DF
}

ssh_local(){
  if [[ $# -lt 2 ]]; then
    echo Syntax: ssh_local socket user
  else
    ssh -o "ProxyCommand nc -U $1" $2@localhost
  fi
}

ssh_host_list(){
  cat ~/.ssh/config | grep "Host "
}

blockip(){
  if (( $# == 0 )); then
    echo Please provide IP as command argument.
    return 1
  fi
  echo Append $1 to ipatbles for drop
  sudo iptables -A INPUT -s $1 -j DROP
}

locate(){
  if (( $# == 0 )); then 
    echo Please provide IP as command argument.
    return 1
  fi
  curl -Ls https://json.geoiplookup.io/$1 | jq -r '"\(.city), \(.country_name)"'

  if read -q "?Block IP ? [y/n] " && echo; then
    blockip $1/24
  else
    echo;
  fi
}

watch_log(){
  if (( $# == 0 )); then 
    echo Please provide log file as command argument.
    return 1
  fi
  tail -F -n 50 "$1" \
  | rg --line-buffered --max-columns 300 --max-columns-preview -v '(?:^# User@Host)|(?:^SET timestamp=)' \
  | sed -u 's/^# Time:/\n=====\t/g' \
  | bat -ppl log
}