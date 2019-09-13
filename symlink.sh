#!/usr/bin/env zsh

DEV="$HOME/Sites"
DOTFILES="$DEV/dotfiles"

# Check if dotfiles directory exists
if [ -d "$DOTFILES" ]; then
  echo "Symlinking dotfiles from $DOTFILES"
else
  echo "$DOTFILES does not exist"
  exit 1
fi

# Function to link files to respective locations
link() {
  from="$1"
  to="$2"

  echo "Linking '$from' to '$to'"

  rm -f "$to"
  ln -s "$from" "$to"
}

for location in $(find . -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  echo $file
  link "$DOTFILES/$location" "$HOME/$file"
done
