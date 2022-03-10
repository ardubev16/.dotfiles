VIM="nvim"
export GIT_EDITOR=$VIM

# edit .dotfiles
alias ezsh="$VIM $DOTFILES/zsh/.config/zsh"
alias evim="$VIM $DOTFILES/nvim/.config/nvim"
alias etmx="$VIM $DOTFILES/tmux/.tmux.conf"

# misc
alias vim="$VIM"
alias ivm="$VIM" # because I can't type
alias xsc="xclip -selection clipboard"
alias abup="antibody bundle < $ZDOTDIR/00-plugins.txt > $ZDOTDIR/.plugins && exec zsh"
alias ez="exec zsh"
alias :q="exit" # vim goodness
eval $(thefuck --alias)

# python alias
alias py3="python3"
alias py2="python2"

# docker containers
alias ctf-stego="docker run --rm -itv \$PWD:/data dominicbreuker/stego-toolkit /bin/bash"
