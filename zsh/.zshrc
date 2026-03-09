# SymbolUser=' '
# SymbolHost='🌏🌎🌍🌐   󱘖  󰒍 󰡰   '
# SymbolPath='📂  󰝰 '
# SymbolPrompt='❱  󱞩 󱞪  '
PROMPT="%B%F{green} %n  %F{cyan} %M  %F{yellow} %~%f%b
%F{#919191}󱞪%f "

y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

lg() {
	export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
	lazygit "$@"
	if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
		cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
		rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
	fi
}

sshz() {
  local FZF_Footer=$(echo "[Enter]:Connect\n[Ctrl+P]:Print" | column -t -s ':')  
  local LF_T=$(echo "\n    ")
  local FZF_DEFAULT_OPTS=''
    rg --pcre2 -o '(?<=^\s{0,10}Host\s)\b[\w.-]+\b' ~/.ssh/config \
  | rg -v '^\s*github\s*$' \
  | fzf --layout=reverse --height=~40% --style=full --query "$1" \
        --footer "$FZF_Footer" \
        --preview-window '68%' \
        --preview " \ssh -q -G {} \
                  | \rg --color=always --colors='match:fg:120,120,120' \
                        '^(host|user|hostname|identityfile|proxycommand|remotecommand) ' \
                        -r '\$1${LF_T}' " \
        --bind 'enter:become:ssh {1}' \
        --bind 'ctrl-p:accept'
}

alias su="su --shell=$(which zsh)"
alias myip="curl -Ls ifconfig.me && echo"
alias lj="lazyjournal"
alias ls="ls --color=auto -lhA"
alias lsr="lsr -lA --group-directories-first --hyperlinks=never"
alias cls="clear && tput cup 1024 0"
alias somo="sudo $(which somo) -c"
alias bandwhich="sudo $(which bandwhich)"
alias pickz="FZF_DEFAULT_OPTS='' fzf --layout=reverse --height=~40% --style=full -m"
alias dft-git-log="git dft-log"
alias dft-git-show="git dft-show"
alias dft-git-diff="git dft-diff"
alias delta="delta --config $HOME/.config/delta/.gitconfig"
alias delta-unified="delta --features=unified-view"
alias delta-split="delta --features=split-view"

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
  \ls -d $DF/*/ | xargs -n 1 basename | xargs stow --no-folding -t $HOME -d $DF --adopt && \
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

list_ddos(){  
  for IP in $(somo --no-pager -p 443 -s remote_address --format '{{remote_address}}|{{state}}' \
              | rg 'synrecv$' \
              | rg -o --pcre2 '(?:\d+\.){3}(?=\d+)' \
              | uniq )
  do
    echo \[ ${IP}xxx \]
    locate ${IP}0
  done
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

if [ -d "$HOME/.zshrc.d" ]; then
  for f in "$HOME/.zshrc.d"/*.zsh; do
    [ -f "$f" ] && source "$f"
  done
fi

