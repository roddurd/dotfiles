#!/bin/zsh

# Get Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew install formulae
brew install                 \
  git                        \
  koekeishiya/formulae/skhd  \
  koekeishiya/formulae/yabai \
  vim                        \
  zsh-autosuggestions        \
  zsh-syntax-highlighting

# brew install apps
brew install --cask  \
  anki               \
  arc                \
  copyq              \
  discord            \
  docker             \
  fl-studio          \
  obs                \
  obsdian            \
  rectangle          \
  spotify            \
  telegram           \
  visual-studio-code \
  warp               \
  whatsapp
  
# ---- non homebrew stuff ------

# Clone my dotfiles
git clone https://github.com/roddurd/dotfiles.git ~/dotfiles

# Create symbolic links between dotfiles and the home directory
ln -s ~/dotfiles/.skhdrc ~/.skhdrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.yabairc ~/.yabairc
ln -s ~/dotfiles/.zshrc ~/.zshrc


source ~/.zshrc
