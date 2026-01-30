return {
  -- Colorscheme (using custom gruvbox.vim from colors/)
  {
    "gruvbox-colorscheme",
    dir = vim.fn.stdpath("config"),
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },
  
  -- Dark/Light mode switcher
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 999,
    opts = {
      update_interval = 999999999, -- Effectively disable auto-polling
      set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd("colorscheme gruvbox")
      end,
      set_light_mode = function()
        vim.opt.background = "light"
        vim.cmd("colorscheme gruvbox")
      end,
    },
    config = function(_, opts)
      local auto_dark_mode = require("auto-dark-mode")
      auto_dark_mode.setup(opts)
      auto_dark_mode.init()
      
      -- Manually trigger check only when reading files
      vim.api.nvim_create_autocmd("BufReadPost", {
        callback = function()
          vim.defer_fn(function()
            auto_dark_mode.init()
          end, 100)
        end,
      })
      
      -- Add manual toggle command
      vim.api.nvim_create_user_command("ToggleTheme", function()
        if vim.opt.background:get() == "dark" then
          vim.opt.background = "light"
        else
          vim.opt.background = "dark"
        end
        vim.cmd("colorscheme gruvbox")
      end, {})
    end,
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "cpp", "c", "lua", "python" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<C-e>"]     = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" }, { name = "buffer" },
        }),
      })
    end,
  },
}

