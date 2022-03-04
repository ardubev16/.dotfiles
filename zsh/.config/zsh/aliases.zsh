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
alias abup="antibody bundle < $ZDOTDIR/plugins.txt > $ZDOTDIR/.plugins"
alias ez="exec zsh"
alias :q="exit" # vim goodness

# python alias
alias py3="python3"
alias py2="python2"
