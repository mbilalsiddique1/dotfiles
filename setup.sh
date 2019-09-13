#!/usr/bin/env zsh

# Define where your projects will reside
DEV="$HOME/Sites"
DOTFILES="$DEV/dotfiles"

# Save current directory into stack
pushd .

if [ ! -d "$DEV" ]; then
  echo "Creating Sites directory for your projects"
  mkdir -p $DEV
fi

# Clone the dotfiles
if [ ! -d "$DOTFILES" ]; then
  git clone --recursive https://github.com/mbilalsiddique1/dotfiles.git $DOTFILES
fi

# If we on macOS, install homebrew and tweak system a bit.
if ! [ -x "$(command -v brew)" ]; then
  echo 'Installing Homebrew…' >&2
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  cd $DOTFILES && brew bundle
fi

# Install the programs and applications defined Brewfile`
cd $DOTFILES && brew bundle

# Link dotfiles for current user home
echo "$(pwd) Symlinking config files..."
. 'symlink.sh'

# Configure sublime text
# . 'sublime/setup.sh'

# Pop the stack to previous directory
popd .
