#!/bin/sh

system_type=$(uname -s)

if [ "$system_type" = "Darwin" ]; then

	# install homebrew if it's missing
	if ! command -v brew >/dev/null 2>&1; then
		echo "Installing homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	# install kitty if it's missing
	if ! command -v kitty >/dev/null 2>&1; then
		echo "Installing kitty terminal"
		/bin/bash -c "$(curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin)"
	fi

	if [ -f "$HOME/.Brewfile" ]; then
		echo "Updating homebrew bundle"
		brew bundle --global
		bat cache --build
	fi

fi
