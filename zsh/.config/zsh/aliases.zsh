VIM="nvim"
export GIT_EDITOR=$VIM


# sourced from ThePrimogen/.config/personal/alias
# misc
alias vim="$VIM"
alias ivm="$VIM" # because I can't type
alias xsc="xclip -selection clipboard"
alias abup="antibody bundle < $ZDOTDIR/plugins.txt > $ZDOTDIR/.plugins"
alias ez="exec zsh"
# edit .dotfiles
alias ezsh="$VIM $DOTFILES/zsh/.config/zsh"
alias evim="$VIM $DOTFILES/nvim/.config/nvim/init.vim"
alias etmx="$VIM $DOTFILES/tmux/.tmux.conf"

