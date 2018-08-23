#!/bin/bash

Install_Thing() {
   name="$1"

   while ["$input" != 'y'] || ["$input" != 'n'];
   do 
      echo "Install $name? (y/n)"
      read -p input;
      if ["$input" != 'y']; then
         echo "Installing $name..."
         return 0
      elif ["$input" != 'n']; then
         echo "Skipping installation..."
         return 1
      fi
   done
}

# Zshrc appender
append_to_zshrc() {
   local text="$1" zshrc
   local skip_new_line="${2:-0}"

   if [ -w "$HOME/.zshrc.local" ]; then
      zshrc="$HOME/.zshrc.local"
   else
      zshrc="$HOME/.zshrc"
   fi

   if ! grep -Fqs "$text" "$zshrc"; then
      if [ "$skip_new_line" -eq 1 ]; then
         printf "%s\\n" "$text" >> "$zshrc"
      else
         printf "\\n%s\\n" "$text" >> "$zshrc"
      fi
   fi
}

export -f Install_Thing
export -f append_to_zshrc


# Dev setup script. Alpha.
#
# # # # # # # # # # # # # # # # # # # # # # #
#                                           #
#                 Installation              #
#                                           #
# # # # # # # # # # # # # # # # # # # # # # #

# Homebrew Checker
if ! command -v brew >/dev/null; then
   echo "Installing Homebrew ..."
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

   append_to_zshrc 'export PATH="/usr/local/bin:$PATH"' 1

   export PATH="/usr/local/bin:$PATH"
fi

# THE ALL POWERFUL
xcode-select --install

# Homebrew Setup
brew upgrade 
brew update

# Get Brew Taps
brew tap macvim-dev/macvim
brew tap lifepillar/appleii
brew tap crisidev/homebrew-chunkwm

# Script invoke
. dev.sh
. env.sh
. utils.sh
. webdev.sh
. gamdev.sh
. media.sh

# # # # # # # # # # # # # # # # # # # # # # #
#                                           #
#                 Configuration             #
#                                           #
# # # # # # # # # # # # # # # # # # # # # # #

cp -r "configs/tmux/tmux.conf" "~/.tmux.conf"
cp -r "configs/vim/.vimrc" "~/.vimrc"
cp -r "configs/zsh/.zshrc" "~/.zshrc"
cp -r "configs/zsh/antigen.zsh" "~/.antigen.zsh"




