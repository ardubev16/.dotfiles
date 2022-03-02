# Shell config file load order:
# 1) .zshenv: usually contains exported variables, e.g. $PATH, $EDITOR, $PAGER,
#             $ZDOTDIR (to specify an alternative location for the rest of the config).
# 2) .zshrc:  used for interactive shell configuration, set options with "setopt" and
#             "unsetopt", load shell modules, set history options, change prompt,
#             setup zle and completion... Set variables used in interactive shell.


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# NVM plugin config
export NVM_DIR=$HOME/.nvm
export NVM_COMPLETION=true

# Sources Antibody plugins
source $ZDOTDIR/.plugins

# export MANPATH="/usr/local/man:$MANPATH"

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/paths.zsh

# nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
    source $HOME/.nix-profile/etc/profile.d/nix.sh;
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
[[ ! -f ~/.config/zsh/p10k-robbyrussell.zsh ]] || source ~/.config/zsh/p10k-robbyrussell.zsh
