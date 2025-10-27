export COLORTERM=truecolor
if [[ $(uname) == "Darwin" ]]; then
	export HOMEBREW_PREFIX="/opt/homebrew";
else
	export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
fi
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar";
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew";
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/opt/binutils/bin:$PATH";
# export CPPFLAGS="-std=c++26"
export C_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$CPLUS_INCLUDE_PATH"
export CXX="$(which g++-15)"
export SHELL="$(which zsh)"
export EDITOR="$(which hx)"
export SUDO_EDITOR="$(which hx)"
export FZF_DEFAULT_OPTS="-m --style=full --preview='\bat --line-range :200 --squeeze-blank -f {}'"
export FZF_DEFAULT_COMMAND='fd -HILtf'
export DFT_PARSE_ERROR_LIMIT=20
