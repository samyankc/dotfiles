# SymbolUser=''
# SymbolHost='🌏🌎🌍🌐'
# SymbolPath='📂'
# SymbolPrompt='❱'
PROMPT="%B%F{green}[]%n %F{cyan}[🌐]%M %F{yellow}[]%~%f%b
 %F{#919191}❱%f "

export BREW_DIR="/home/linuxbrew/.linuxbrew/bin"
export PATH="$HOME/bin:$HOME/.local/bin:$BREW_DIR:$PATH"
export LIBRARY_PATH="$HOME/lib:$BREW_DIR/../lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/lib:$BREW_DIR/../lib:$LD_LIBRARY_PATH"

export COLORTERM=truecolor
export SUDO_EDITOR="$(which hx)"

ssh_host_list(){
  cat ~/.ssh/config | grep "Host "
}

alias myip="curl ifconfig.me && echo"
alias ls="ls --color -lh"
alias cls="clear && tput cup 1024 0"
cls
