# Browser.
# --------
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors.
# --------
export EDITOR='/Applications/Visual Studio Code.app/Contents/MacOS/Electron'
export VISUAL='/Applications/Visual Studio Code.app/Contents/MacOS/Electron'
export REACT_EDITOR='/Applications/Visual Studio Code.app/Contents/MacOS/Electron'

# Language.
# ---------
if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi

# Paths.
# ------
typeset -gU cdpath fpath mailpath manpath path
typeset -gUT INFOPATH infopath

# Commonly used directories.
dev="$HOME/Sites"
mb="$dev"
as="$HOME/Library/Application Support"

# Set the the list of directories that cd searches.
cdpath=(
  $cdpath
)

# Set the list of directories that info searches for manuals.
infopath=(
  /usr/local/share/info
  /usr/share/info
  $infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
  /usr/local/share/man
  /usr/share/man
  $manpath
)

for path_file in /etc/manpaths.d/*(.N); do
  manpath+=($(<$path_file))
done
unset path_file

# Temporary Files.
if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi


BROWSER=''
unset BROWSER

# export NODE_PATH='/usr/local/lib/node_modules'
export HOMEBREW_AUTO_UPDATE_SECS='2592000'
export PATH="/usr/local/opt/ruby/bin:$PATH"
export GPG_TTY=$(tty) # For git commit signing
if [ -e /Users/bilal/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/bilal/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
