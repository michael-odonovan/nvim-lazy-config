return {

  ----------------------------
  ----    experimental    ----
  ----------------------------

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',


  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        -- icons_enabled = false,
        theme = 'catppuccin',
      },
      sections = {
        lualine_a = {'branch'},
        lualine_b = {{ 'filename', path = 1 }},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
    },
  },


  -- Undo Tree
  { "mbbill/undotree" },


  ----------------------------
  ----    keepers         ----
  ----------------------------

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb', -- :GBrowse
  'kdheepak/lazygit.nvim',


  { -- Colorscheme
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },


  { -- Telescope
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },


  {
    'norcalli/nvim-colorizer.lua',
    event = "BufRead",
    config = function() require'colorizer'.setup() end
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
  -- require("luasnip.loaders.from_vscode").load({
    -- paths = { "~/.config/nvim/snippets" }
  -- })
  }

}
