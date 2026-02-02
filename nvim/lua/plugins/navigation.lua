return {
  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  { "folke/trouble.nvim", opts = {} },

  { "nvim-tree/nvim-tree.lua", opts = {} },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
    require("toggleterm").setup()
    end
  }

}

