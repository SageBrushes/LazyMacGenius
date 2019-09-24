#!/bin/bash
# To execute: save and `chmod +x ./BrewItUpYo.sh` then `./BrewItUpYo.sh.sh`

echo Install Mac App Store apps first.

# Either use mas-cli (https://github.com/argon/mas) or install manually;
read -p "Press any key to continue… " -n1 -s
echo '\n'

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
brew upgrade --all

# Install my brew packages
brew install wget
brew install ffmpeg
brew install mas
brew tap buo/cask-upgrade

# Install cask
brew tap caskroom/cask

# Install desired cask packages
brew cask install 1password
brew cask install alfred
brew cask install cakebrew
brew cask install dropbox
brew cask install mpv
brew cask install google-chrome
brew cask install coda
brew cask install adobe-creative-cloud
brew cask install charles
brew cask install mamp
brew cask install lastpass
brew cask install transmit
brew cask install virtualbox
brew cask install vmware-fusion
brew cask install vnc-viewer
brew cask install unlox
brew cask install microsoft-office
brew cask install handbrake
brew cask install obs
brew cask install textexpander
brew cask install firefox
brew cask install earthdeskpreferpane
brew cask install slack
brew cask install spotify
brew cask install openvpn
brew cask install discord
brew cask install github
brew cask install handbrake
brew cask install mediinfo
brew cask install omnioutliner
brew cask install ringcentral
brew cask install ringcentral-meetings
brew cask install zoomus

# Remove brew cruft
brew cleanup

# Remove cask cruft
brew cask cleanup

# Link alfred to apps
brew cask alfred link
