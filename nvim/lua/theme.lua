return {

  -- Colorscheme (using custom gruvbox.vim from colors/)
  {
    "gruvbox-colorscheme",
    dir = vim.fn.stdpath("config"),
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end,
  },

}
