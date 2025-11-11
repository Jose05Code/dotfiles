#!/bin/bash
# zsh plugin requirements install script
# Usage: bash zsh.requirements

set -e

echo "Installing required plugins/packages..."

# Install eza (modern ls replacement)
if ! command -v eza &> /dev/null; then
	sudo pacman -S --noconfirm eza
else
	echo "eza already installed."
fi

# Install fzf (fuzzy finder)
if ! command -v fzf &> /dev/null; then
	sudo pacman -S --noconfirm fzf
else
	echo "fzf already installed."
fi

# Install bat (cat replacement)
if ! command -v bat &> /dev/null; then
	sudo pacman -S --noconfirm bat
else
	echo "bat already installed."
fi

# Install zoxide (cd replacement)
if ! command -v zoxide &> /dev/null; then
	sudo pacman -S --noconfirm zoxide
else
	echo "zoxide already installed."
fi

echo "All required plugins/packages are installed."