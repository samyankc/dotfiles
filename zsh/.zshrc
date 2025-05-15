# SymbolUser=' '
# SymbolHost='🌏🌎🌍🌐   󱘖  󰒍 󰡰   '
# SymbolPath='📂  󰝰 '
# SymbolPrompt='❱  󱞩 󱞪  '
PROMPT="%B%F{green} %n  %F{cyan} %M  %F{yellow} %~%f%b
%F{#919191}󱞪%f "

# export CPPFLAGS="-std=c++26"
export COLORTERM=truecolor
if [[ $(uname) == "Darwin" ]]; then
	export HOMEBREW_PREFIX="/opt/homebrew";
else
	export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
fi
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar";
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew";
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/opt/binutils/bin:$PATH";
export CXX="$(which g++-14)"
export SHELL="$(which zsh)"
export EDITOR="$(which hx)"
export SUDO_EDITOR="$(which hx)"
export FZF_DEFAULT_OPTS="-m --style=full --preview='\chafa {} 2>/dev/null || \bat --line-range :200 --squeeze-blank -f {}'"
export FZF_DEFAULT_COMMAND='fd -HILtf'

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
alias myip="curl ifconfig.me && echo"
# alias ls="ls --color=auto -lhA --group-directories-first"
alias ls="ls --color=auto -lhA"
alias cls="clear && tput cup 1024 0"

if [ -n "$YAZI_LEVEL" ]; then
    PROMPT=" %F{yellow}[ Yazi Sub Shell ] %F{#919191}%B#%b%f "
    clear
else
    cls
fi

ssh_host_list(){
  cat ~/.ssh/config | grep "Host "
}
