#!/bin/bash

DOTFILES=$(cd `dirname $0` && pwd)

# Take ownership of /usr/local files
sudo chown -R $USER:admin /usr/local/*

# Install OSX command line tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install CLI formulae
/usr/local/bin/brew install \
	git \
	zsh \
	zsh-completions \
	ripgrep \
	fzf \
	vim \
	go \
	nvm

# Install GUI formulae
/usr/local/bin/brew cask install \
	iterm2 \
	google-chrome \
	karabiner-elements

# Install source code pro font
/usr/local/bin/brew tap homebrew/cask-fonts && brew cask install font-source-code-pro

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Replace default configs with symlinks
rm -rf $HOME/.config/karabiner && ln -s $DOTFILES/karabiner $HOME/.config/karabiner && launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server
rm -f $HOME/{.zshenv,.zprofile,.zshrc,.zlogin,.zlogout} && ln -s $DOTFILES/zsh/zshenv $HOME/.zshenv && ln -s $DOTFILES/zsh/zprofile $HOME/.zprofile && ln -s $DOTFILES/zsh/zshrc $HOME/.zshrc && ln -s $DOTFILES/zsh/zlogin $HOME/.zlogin && ln -s $DOTFILES/zsh/zlogout $HOME/.zlogout
rm -rf $HOME/.vim && ln -s $DOTFILES/vim $HOME/.vim
rm -f $HOME/.gitignore && ln -s $DOTFILES/git/gitignore $HOME/.gitignore
rm -f $HOME/.gitconfig && ln -s $DOTFILES/git/gitconfig $HOME/.gitconfig

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
