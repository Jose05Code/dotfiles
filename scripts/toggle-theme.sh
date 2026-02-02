#! /usr/bin/bash

file_nvim="$HOME/dotfiles/nvim/lua/Aicama/theme.lua"
file_kitty="$HOME/dotfiles/kitty/kitty.conf"

if grep -q 'vim.opt.background = "light"' $file_nvim; then
    # Switch to dark theme
    sed -i 's/vim.opt.background = "light"/vim.opt.background = "dark"/' $file_nvim
    echo "Switched to dark theme"
else
    # Switch to light theme
    sed -i 's/vim.opt.background = "dark"/vim.opt.background = "light"/' $file_nvim
    echo "Switched to light theme"
fi

if grep -q 'gruvbox_light' $file_kitty; then
    # Switch to dark theme
    sed -i 's/gruvbox_light/gruvbox/' $file_kitty
else
    # Switch to light theme
    sed -i 's/gruvbox/gruvbox_light/' $file_kitty
fi
