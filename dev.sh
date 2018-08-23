#!/bin/bash

echo "Oi! You a developer mate? (entered dev.sh)"
source ./funcs.sh

# oh-my-zsh | iterm2
echo "Installing zsh and iterm2..."
brew install zsh zsh-completions
brew install universal-ctags --HEAD
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install antigen
brew cask install iterm2

# General Dev 
echo "installing macvim..."
brew install macvim --with-override-system-vim --with-lua --HEAD
brew cask install atom

# Lang Support
# C#
# F#
echo "Installing mono..."
brew cask install mono-mdk

if [Install_Thing "Visual-Studio"]; then
   brew cask install visual-studio
fi

# Java
echo "installing java 8, 10 and jenv..."
brew cask install java java8
brew install jenv

# python
brew install python
brew install pyenv

# Lua
if [Install_Thing "lua"]; then
   brew install lua
fi

# Prolog
if [Install_Thing "swi-prolog"]; then
   brew install swi-prolog
fi

# Haskell
if [Install_Thing "haskell-stack"]; then
   brew install haskell-stack
fi

# R
if [Install_Thing "R"]; then
   brew install R
fi

# C - GDB
echo "Installing gdb..."
brew install gdb

# Git
echo "installing git and git accessories..."
brew install git hub git-lfs

# VM & containers

echo "installing vmware and docker..."
if [Install_Thing "vmware-fusion"]; then
   brew install R
fi

if [Install_Thing "docker"]; then
   brew cask install docker kitematic
fi

echo "completed dev.sh"
