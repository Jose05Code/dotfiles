#! /usr/bin/bash

file="$HOME/dotfiles/nvim/lua/Aicama/theme.lua"
if grep -q 'vim.opt.background = "light"' $file; then
    # Switch to dark theme
    sed -i 's/vim.opt.background = "light"/vim.opt.background = "dark"/' $file
    echo "Switched to dark theme"
else
    # Switch to light theme
    sed -i 's/vim.opt.background = "dark"/vim.opt.background = "light"/' $file
    echo "Switched to light theme"
fi

