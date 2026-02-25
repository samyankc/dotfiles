export COLORTERM=truecolor
if [[ $(uname) == "Darwin" ]]; then
	export HOMEBREW_PREFIX="/opt/homebrew"
else
	export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
fi
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH:$HOMEBREW_PREFIX/opt/binutils/bin"
# export CPPFLAGS="-std=c++26"
export C_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$CPLUS_INCLUDE_PATH"
if which g++-15 > /dev/null 2>&1; then
	export CXX="$(which g++-15)"
else
	export CXX="$(which g++)"
fi
if which podman > /dev/null 2>&1; then
	export DOCKER_HOST="unix:///run/user/$UID/podman/podman.sock"
fi
export SHELL="$(which zsh)"
export EDITOR="$(which hx)"
export VISUAL=$EDITOR
export SUDO_EDITOR=$EDITOR
export FZF_DEFAULT_OPTS="-m --style=full --preview='\bat --line-range :200 --squeeze-blank -f {}'"
export FZF_DEFAULT_COMMAND='fd -HILtf'
export DFT_PARSE_ERROR_LIMIT=20
export GIT_CONFIG_GLOBAL="$HOME/.gitconfig.zsh"
