#!/bin/zsh

zmodload -i zsh/complist

DIRSTACKSIZE=10

# setup LS_COLORS
eval "$(dircolors -b)"

zstyle ':completion:*:default'               list-colors ${(s.:.)LS_COLORS}
