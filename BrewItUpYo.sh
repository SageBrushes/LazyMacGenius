#!/bin/zsh

# Prompt for the user's admin password upfront
echo "Please enter your admin password for installation purposes:"
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script finishes
while true; do sudo --validate; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check that Homebrew is installed and install if not
if ! command -v brew &>/dev/null
then
  echo "  Installing Homebrew for you."
  /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
brew upgrade

# Install mas (Mac App Store command-line tool)
brew install mas

echo "Start by installing Mac App Store apps."

# List of Mac App Store apps to install using mas. Uncomment and replace with your desired apps:
# mas_apps=(803453959 1333542190)

# Uncomment the below line and modify with your desired app identifiers
# mas install "${mas_apps[@]}"

echo "Finished installing Mac App Store apps. Continuing with other installations..."

# Install brew packages
brew install wget ffmpeg htop youtube-dl imagemagick

# Install desired cask packages
brew install --cask 1password alfred cakebrew dropbox mpv google-chrome coda adobe-creative-cloud charles mamp lastpass transmit virtualbox vmware-fusion vnc-viewer betterzip unlox microsoft-office handbrake obs textexpander firefox slack spotify openvpn discord github handbrake mediainfo omnioutliner ringcentral ringcentral-meetings zoom

# Remove brew cruft
brew cleanup

# Link Alfred to apps (if Alfred and the apps are installed)
if command -v alfred &>/dev/null && command -v brew &>/dev/null
then
  brew alfred link
fi
