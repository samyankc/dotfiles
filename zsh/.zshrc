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
alias fzf="fzf --preview='bat -f {}'"
alias myip="curl ifconfig.me && echo"
alias ls="ls --color=auto -lhA --group-directories-first"
alias cls="clear && tput cup 1024 0"
cls

ssh_host_list(){
  cat ~/.ssh/config | grep "Host "
}

configure_nginx(){
  conf_path_1="/etc/nginx/nginx.conf"
  conf_path_2="/etc/nginx/sites-available/default"
  echo "1) configure ${conf_path_1}"
  echo "2) configure ${conf_path_2}"
  echo "3) reload config"
  read option
  case ${option} in
    1)
      sudoedit ${conf_path_1}
      ;;
    2)
      sudoedit ${conf_path_2}
      ;;
    3)
      sudo systemctl restart nginx.service
      ;;
  esac
}
