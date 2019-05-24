#!/bin/bash

# Define some local variables
ROOT=$(dirname $0)

# Install OSX command line tools
# if the output of "xcode-select -p" is not an existing directory
if [ ! -d "$(xcode-select -p)" ]; then
  xcode-select --install
fi

# Install Homebrew and packages
mkdir -p $HOME/brew/usr/local && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/brew/usr/local
xargs $HOME/brew/usr/local/bin/brew install < $ROOT/homebrew/brew.formulae
xargs $HOME/brew/usr/local/bin/brew cask install < $ROOT/homebrew/cask.formulae

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
