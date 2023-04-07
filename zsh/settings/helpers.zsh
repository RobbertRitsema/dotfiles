#!/bin/zsh

COMPDUMPFILE=${ZDOTDIR:-${HOME}}/.zcompdump

fancy-ctrl-z()
{
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}

# see http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html#index-tty_002c-freezing
ttyctl -f
