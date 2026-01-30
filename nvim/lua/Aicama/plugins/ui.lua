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
    },

    -- UI enhancements and notifications
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            local bg_color = vim.opt.background:get() == "dark" and "#1d2021" or "#fbf1c7"
            require("notify").setup({
                background_colour = bg_color,
            })
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = false,
                    lsp_doc_border = false,
                },
            })
        end
    },

    -- Highlight current code chunk/block
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true,
                    chars = {
                        horizontal_line = "─",
                        vertical_line = "│",
                        left_top = "┌",
                        left_bottom = "└",
                        right_arrow = "─",
                    },
                    style = "#00ffff",
                    duration = 200,
                    delay = 300,
                },
                line_num = {
                    enable = false,
                },
                blank = {
                    enable = false,
                },
            })
        end
    },

    {
        'akinsho/bufferline.nvim',
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    numbers = "none",
                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = nil,
                    indicator = {
                        style = 'icon',
                        icon = '▎',
                    },
                    buffer_close_icon = '󰅖',
                    modified_icon = '●',
                    close_icon = '',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "center",
                            separator = true
                        }
                    },
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    separator_style = "thin",
                    always_show_bufferline = true,
                }
            })
        end
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup()
        end
    },

    -- Highlight matching words under cursor
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require('illuminate').configure({
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                delay = 100,
                filetypes_denylist = {
                    'NvimTree',
                    'alpha',
                },
                under_cursor = true,
            })
        end
    },


}
