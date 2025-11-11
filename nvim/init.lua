vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("config") .. "/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Core Modules
require("Aicama.opts")
require("Aicama.keymaps")
require("Aicama.autocmds")

-- Plugins
require("lazy").setup({
    spec = {
        { import = "Aicama.plugins.core" },	
        { import = "Aicama.plugins.navigation" },
        { import = "Aicama.plugins.editing" },
        { import = "Aicama.plugins.git" },
},
install = { colorscheme = { "tokyonight" } },
checker = { enabled = true },
})

require("Aicama.lsp.clangd")
