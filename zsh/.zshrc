#!/bin/zsh

# catch non-zsh and non-interactive shells
[[ $- == *i* && $ZSH_VERSION ]] && SHELL=/usr/bin/zsh || return 0

# Automatically install znap
[[ -f ~/.config/zsh/zsh-plugins/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/zsh-plugins/zsh-snap 

source ~/.config/zsh/zsh-plugins/zsh-snap/znap.zsh

# add ~/bin to the path if not already, the -U flag means 'unique'
typeset -U path=($HOME/bin "${path[@]:#}")

# used internally by zsh for loading themes and completions
typeset -U fpath=("$ZDOTDIR/"{completion,themes} $fpath)

# source shell configuration files
for f in "$ZDOTDIR"/{settings,plugins}/*?.zsh; do
    . "$f" 2>/dev/null
done

autoload -U promptinit; promptinit

znap prompt pure

# setup LS_COLORS
eval "$(dircolors -b)"

znap source marlonrichert/zsh-autocomplete
znap source jessarcher/zsh-artisan 
znap source sindresorhus/pure
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting

eval $(thefuck --alias)
