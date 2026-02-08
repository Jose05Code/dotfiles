vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("config") .. "/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Core Modules
require("opts")
require("keymaps")
require("autocmds")
-- Plugins
require("lazy").setup({
    spec = {
        { import = "plugins.core" },	
        { import = "plugins.navigation" },
        { import = "plugins.editing" },
        { import = "plugins.git" },
        { import = "plugins.ui"},
        { import = "theme"},
        { import = "plugins.previews" },
},
install = { colorscheme = { "gruvbox" } },
checker = { enabled = true },
})

require("lsp.clangd")
