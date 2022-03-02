VIM="nvim"
export GIT_EDITOR=$VIM


# sourced from ThePrimogen/.config/personal/alias
# misc
alias vim="$VIM"
alias xsc="xclip -selection clipboard"
alias abup="antibody bundle < $ZDOTDIR/plugins.txt > $ZDOTDIR/.plugins"
alias dotFileInstall="$DOTFILES/install"
alias zp="dotFileInstall && source ~/.zshrc"
# .zsh_profile
alias czp="cat $DOTFILES/zsh/.zsh_profile"
alias ezp="$VIM $DOTFILES/zsh/.zsh_profile"
# .vimrc
alias cvrc="cat $DOTFILES/nvim/.config/nvim/init.vim"
alias evrc="$VIM $DOTFILES/nvim/.config/nvim/init.vim"
# .tmux.conf
alias ctc="cat $DOTFILES/tmux/.tmux.conf"
alias etc="$VIM $DOTFILES/tmux/.tmux.conf"

