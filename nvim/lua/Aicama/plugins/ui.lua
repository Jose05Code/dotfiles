return {
   {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "             >> A good day to die <<              ",
    }

    local new_file_btn = dashboard.button("e", "  New file", "<cmd>lua _ALPHA_NEW_FILE()<CR>")

    _G._ALPHA_NEW_FILE = function()
        vim.ui.input({ prompt = "New file name: " }, function(name)
            if not name or name == "" then
                vim.cmd("enew")
                return
            end 

                vim.cmd("edit " .. vim.fn.fnameescape(name))
            end)
        end 


    dashboard.section.buttons.val = {
      new_file_btn,
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "󰊢  Git status", ":LazyGit <CR>"),
      dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.config)
  end,
    },
 

    {
      "stevearc/dressing.nvim",
      event = "VeryLazy",
      opts = {
        input = {
          enabled = true,
          default_prompt = "➤ ",
          prompt_align = "left",
          insert_only = true,
          start_in_insert = true,
          border = "rounded",
          relative = "cursor",
          prefer_width = 40,
          win_options = {
            winblend = 0,
          },
        },

        select = {
          enabled = true,
          backend = { "telescope", "builtin" },

          builtin = {
            border = "rounded",
            relative = "cursor",
            win_options = {
              winblend = 0,
            },
          },
        },
      },
    }

}
