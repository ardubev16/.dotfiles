# Shell config file load order:
# 1) .zshenv: usually contains exported variables, e.g. $PATH, $EDITOR, $PAGER,
#             $ZDOTDIR (to specify an alternative location for the rest of the config).
# 2) .zshrc:  used for interactive shell configuration, set options with "setopt" and
#             "unsetopt", load shell modules, set history options, change prompt,
#             setup zle and completion... Set variables used in interactive shell.
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/zsh/02-starship.toml"
eval "$(starship init zsh)"

# To check performance of zsh startup use zprof
# zmodload zsh/zprof

# NVM plugin config
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=("$VIM")

# Sources Antibody plugins
source "$ZDOTDIR"/.plugins

# Other sources
source "$ZDOTDIR"/03-aliases.zsh
source "$ZDOTDIR"/04-functions.zsh
source "$ZDOTDIR"/05-completions.zsh
source "$ZDOTDIR"/06-vpn.zsh
source "$ZDOTDIR"/07-ctf.zsh

# Remove duplicate entries from PATH:
pathPrepend "$HOME"/.local/bin
pathPrepend "$HOME"/.local/share/cargo/bin
pathPrepend "$HOME"/.local/share/gem/ruby/3.0.0/bin
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')
