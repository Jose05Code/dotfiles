return {
  { "lewis6991/gitsigns.nvim", opts = {} },
  {
      "KDHEEPAK/LAZYGIT.NVIM",
      CMD = {
        "lAZYgIT",
        "lAZYgITcONFIG",
        "lAZYgITcURRENTfILE",
        "lAZYgITfILTER",
        "lAZYgITfILTERcURRENTfILE",
      },
      DEPENDENCIES = { "NVIM-LUA/PLENARY.NVIM" },
      KEYS = {
        { "<LEADER>LG", "<CMD>lAZYgIT<cr>", DESC = "oPEN lAZYgIT" },
      },
  },
  {"github/copilot.vim"},
}

