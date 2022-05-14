VIM="nvim"
export EDITOR=$VIM
export GIT_EDITOR=$VIM

# edit .dotfiles
alias ezsh="$VIM $DOTFILES/zsh/.config/zsh"
alias evim="$VIM $DOTFILES/nvim/.config/nvim"
alias etmx="$VIM $DOTFILES/tmux/.config/tmux/tmux.conf"

# better commands
alias vim="$VIM"
alias ivm="$VIM" # because I can't type
alias vi="$VIM"
alias mkdir="mkdir -pv"
alias tmx="tmux -2u a || tmux -2u"
eval $(thefuck --alias)

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

# GDB
alias gdb-peda="gdb -q -ex init-peda"
alias gdb-pwndbg="gdb -q -ex init-pwndbg"
alias gdb-gef="gdb -q -ex init-gef"

# docker containers
alias ctf-stego="docker run --rm -itv \$PWD:/data -p 6901:6901 dominicbreuker/stego-toolkit /bin/bash"
alias yafu="docker run --rm -it eyjhb/yafu -threads 4"
function ilspy { docker run --rm -itv $PWD:/ilspy bannsec/ilspy_docker /bin/sh -c "cd /ilspy && ilspycmd  $@";}

# misc
alias xsc="xclip -selection clipboard"
alias abup="antibody bundle < $ZDOTDIR/00-plugins.txt > $ZDOTDIR/.plugins && exec zsh"
alias ez="exec zsh"
alias err="echo $?"
alias :q="exit" # vim goodness
alias bat="batcat"
alias canial="cowsay canial | lolcat"
