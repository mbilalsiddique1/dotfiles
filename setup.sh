#!/usr/bin/env zsh

# Define where your projects will reside
DEV="$HOME/Sites"

# Save current directory into stack
pushd .

if [ ! -d "$DEV" ]; then
  echo "Creating Sites directory for your projects"
  mkdir -p $DEV
fi

# Move inside Sites directory
cd $DEV

# If we on macOS, install homebrew and tweak system a bit.
if ! [ -x "$(command -v brew)" ]; then
  echo 'Installing Homebrew…' >&2
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Link dotfiles for current user home
echo 'Symlinking config files...'
source 'symlink.sh'

popd .

echo "This is working...."
