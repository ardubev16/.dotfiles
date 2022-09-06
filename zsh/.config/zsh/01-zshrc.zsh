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

# Options
# zmodload zsh/zprof
setopt extendedglob

VIM="nvim"
export EDITOR=$VIM
export GIT_EDITOR=$VIM
export ZVM_INIT_MODE="sourcing"

# NVM plugin config
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=("$VIM")

# Sources Antibody plugins
source "$ZDOTDIR"/.plugins

# Other sources
source "$ZDOTDIR"/02-aliases.zsh
source "$ZDOTDIR"/03-functions.zsh
source "$ZDOTDIR"/04-completions.zsh
source "$ZDOTDIR"/05-prompt.zsh
source "$ZDOTDIR"/06-ctf.zsh

# Remove duplicate entries from PATH:
pathPrepend "$HOME"/.local/bin
pathPrepend "$HOME"/.local/share/cargo/bin
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')
