# Opts
setopt extendedglob
setopt globdots
zstyle ':completion:*' special-dirs false

# Docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

autoload -Uz compinit
if [[ -n "$ZSH_COMPDUMP"(#qN.mh+24) ]]; then
    compinit -d "$ZSH_COMPDUMP"
else
    compinit -C
fi
