# Docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# The following lines were added by compinstall
zstyle :compinstall filename '~/.config/zsh/02-completions.zsh'

autoload -Uz compinit
compinit
# End of lines added by compinstall
