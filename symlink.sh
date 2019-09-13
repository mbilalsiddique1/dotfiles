#!/usr/bin/env zsh

DEV="$HOME/Sites"
DOTFILES="$DEV/dot"

if [ -d "$DOTFILES" ]; then
  echo "Symlinking dotfiles from $DOTFILES"
else
  echo "$DOTFILES does not exist"
  exit 1
fi
