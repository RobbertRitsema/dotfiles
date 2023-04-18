cp -r ~/.config/alacritty/ ./
cp -r ~/.config/nvim/ ./
cp -r ~/.config/nwg-bar/ ./
cp -r ~/.config/sway/ ./
cp -r ~/.config/tmux/ ./
cp -r ~/.config/waybar/ ./
rsync -a ~/.config/zsh/ ./zsh/ --exclude zsh-plugins
