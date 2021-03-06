# edit .dotfiles
alias ezsh="$VIM $DOTFILES/zsh/.config/zsh"
alias evim="$VIM $DOTFILES/nvim/.config/nvim/lua/user"
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

# python alias
alias py3="python3"
alias py2="python2"
alias ve="python3 -m venv ./venv"
alias va="source ./venv/bin/activate"

# misc
alias xsc="xclip -selection clipboard"
alias abup="antibody bundle < $ZDOTDIR/99-plugins.txt > $ZDOTDIR/.plugins && exec zsh"
alias ez="exec zsh"
alias gspull="git pull && git submodule foreach \"git checkout master\""
alias err="echo $?"
alias :q="exit" # vim goodness
if command -v batcat &>/dev/null; then
    alias bat="batcat"
fi
alias canial="cowsay canial | lolcat"
