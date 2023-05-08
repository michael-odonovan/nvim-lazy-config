-- local nightfly = require('lualine.themes.nightfly')
-- nightfly.normal.c.bg = 'None'

return {

  ----------------------------
  ----    experimental    ----
  ----------------------------

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Undo Tree
  { "mbbill/undotree" },


  {
    "akinsho/toggleterm.nvim",
    config = function() require"toggleterm".setup() end
  },


  ----------------------------
  ----    stable         ----
  ----------------------------

  -- GIT
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb', -- :GBrowse
  'kdheepak/lazygit.nvim',


  -- COLORSCHEME
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },


  -- TELESCOPE
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() 
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-p>'] = require('telescope.actions').cycle_history_prev,
              ['<C-n>'] = require('telescope.actions').cycle_history_next,
            },
          },
        },
      }
    end,
  },


  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        plugins = {
          marks = false,
          registers = false,
          spelling = {
            suggestions = 10,
          },
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
          },
        },
        motions = {
          count = false,
        },
        show_help = false, -- show a help message
        show_keys = false, -- show the currently pressed key
      }
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    event = "BufRead",
    config = function()
      require'colorizer'.setup({
        'lua';
        'css';
        'javascript';
        html = {
          mode = 'foreground';
        }
      })
    end
  },

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  { "lukas-reineke/indent-blankline.nvim" },

  { "davidgranstrom/nvim-markdown-preview" },

  { "kyazdani42/nvim-web-devicons" },

  {
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end
  },

  {
    "kylechui/nvim-surround",
    tag = "*",
    config = function() require("nvim-surround").setup() end
  },


  -- <C-y,> real quick
  { "mattn/emmet-vim" },

  -- makes it able to to repeat vim-surround functions
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- adds shortcuts for highlighting inner jsx tags
  { "michaeljsmith/vim-indent-object" },

  {
    "dense-analysis/neural",
    config = function()
      require("neural").setup {
        source = {
          openai = {
            api_key = vim.env.OPENAI_API_KEY,
          },
        },
      }
    end,
  },

  { "theprimeagen/harpoon" },

  { "L3MON4D3/LuaSnip",
    config = function ()
      require("luasnip.loaders.from_vscode").load({
        paths = { "~/.config/nvim/snippets" }
      })
    end
  }

}
