# SymbolUser=' '
# SymbolHost='🌏🌎🌍🌐   󱘖  󰒍 󰡰   '
# SymbolPath='📂  󰝰 '
# SymbolPrompt='❱  󱞩 󱞪  '
PROMPT="%B%F{green} %n  %F{cyan} %M  %F{yellow} %~%f%b
%F{#919191}󱞪%f "

# export CPPFLAGS="-std=c++23"
export COLORTERM=truecolor
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/opt/binutils/bin:$PATH";
export SUDO_EDITOR="$(which hx)"
export EDITOR="$(which hx)"
export FZF_DEFAULT_OPTS="-m --inline-info --preview='chafa {} 2>/dev/null || bat -f {}'"

alias myip="curl ifconfig.me && echo"
alias ls="ls --color=auto -lhA --group-directories-first"
alias cls="clear && tput cup 1024 0"
cls

ssh_host_list(){
  cat ~/.ssh/config | grep "Host "
}
