#!/bin/zsh

# catch non-zsh and non-interactive shells
[[ $- == *i* && $ZSH_VERSION ]] && SHELL=/usr/bin/zsh || return 0

# Automatically install znap
[[ -f ~/.config/zsh/zsh-plugins/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/zsh-plugins/zsh-snap 

source ~/.config/zsh/zsh-plugins/zsh-snap/znap.zsh

# setup LS_COLORS
eval "$(dircolors -b)"

# source shell configuration files
for f in "$ZDOTDIR"/{settings,plugins}/*?.zsh; do
    . "$f" 2>/dev/null
done

autoload -U promptinit; promptinit
znap prompt pure

znap source marlonrichert/zsh-autocomplete
znap source jessarcher/zsh-artisan 
# znap source sindresorhus/pure # INstalled system level
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting
znap source darvid/zsh-poetry

eval $(thefuck --alias)

# pnpm
export PNPM_HOME="/home/sjaak/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
