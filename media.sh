#!/bin/bash

echo "Play ALL the things (entering media.sh)"
source ./funcs.sh

# Browsing
brew cask install google-chrome

# Music and Video
brew cask install spotify
# brew install mpd
brew install itunes-remote
brew install shpotify

# Gaming
brew cask install twitch
brew cask install steam

# Social
brew install weechat
brew cask install skype
brew cask install discord

# Discline - Terminal Client for Discord
pip3 install asyncio discord blessings pyyamli
git clone https://github.com/MitchWeaver/Discline

# RTV - Terminal Client for redit
brew install rtv

# Fun
brew install toilet
brew install lolcat
brew install fortune
brew install nethack
brew install slashem
brew install sl

echo "Leaaving media.sh"
