# edit .dotfiles
alias ezsh="$VIM $DOTFILES/zsh/.config/zsh"
alias evim="$VIM $DOTFILES/nvim/.config/nvim"
alias etmx="$VIM $DOTFILES/tmux/.config/tmux/tmux.conf"
alias ei3="$VIM $DOTFILES/i3-xorg/.config/i3/config"
alias epbr="$VIM $DOTFILES/i3-xorg/.config/polybar"

# better commands
alias vim="$VIM"
alias ivm="$VIM" # because I can't type
alias vi="$VIM"
alias mkdir="mkdir -pv"
alias tmx="tmux -2u a || tmux -2u"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias btop="btop --utf-force"

# grep
alias agrep="alias | grep"
alias hgrep="history | grep"
alias psgrep="ps aux | grep"

# network
alias ports="netstat -tulanp"
alias wget="wget -c"
alias ipe="curl -s ipinfo.io | jq"
alias site-dl="wget --random-wait -rpe robots=off -U mozilla"

# display
alias hdmiclone="xrandr --output HDMI-A-0 --auto --same-as eDP"
alias hdmir="xrandr --output HDMI-A-0 --auto --right-of eDP"
alias hdmil="xrandr --output HDMI-A-0 --auto --left-of eDP"
alias hdmioff="xrandr --output HDMI-A-0 --off"

# misc
alias xsc="xclip -selection clipboard"
alias abup="antibody bundle < $ZDOTDIR/99-plugins.txt > $ZDOTDIR/.plugins && exec zsh"
alias ez="exec zsh"
alias gspull="git pull && git submodule foreach \"git checkout master\""
alias cat="bat"
alias rpg="openssl rand -hex"
if command -v podman &> /dev/null; then
    alias docker="podman"
fi
