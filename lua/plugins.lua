-- local nightfly = require('lualine.themes.nightfly')
-- nightfly.normal.c.bg = 'None'

return {

  -----------------------------------------
  --          NEW                        --
  -----------------------------------------

  -- Undo Tree
  'mbbill/undotree',


  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',


  -- {
  --   'akinsho/toggleterm.nvim',
  --   config = function() require('toggleterm').setup() end
  -- },




  -----------------------------------------
  --          STABLE                     --
  -----------------------------------------

  -- Colorschemes
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  -- },


  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb', -- :GBrowse
  'kdheepak/lazygit.nvim',


  -- Telescope
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


  -- Harpoon
  'theprimeagen/harpoon',


  -- Which-Key
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup {
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


  -- Colorizer
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('colorizer').setup({
        'lua';
        'css';
        'javascript';
        html = {
          mode = 'foreground';
        }
      })
    end
  },


  -- IMPROVED TEXT EDITING
  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  },

  -- Surround
  {
    'kylechui/nvim-surround',
    tag = '*',
    config = function() require('nvim-surround').setup() end
  },

  -- Repeat Surround
  { 'tpope/vim-repeat', event = 'VeryLazy' },

  -- Emmet =>  <C-y>,  real quick
  'mattn/emmet-vim',

  -- Indent Group Selecting
  'michaeljsmith/vim-indent-object',


  -- Trouble
  {
    'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
  },


  'lukas-reineke/indent-blankline.nvim',


  'davidgranstrom/nvim-markdown-preview',


  'kyazdani42/nvim-web-devicons',


  -- Neural AI
  {
    'dense-analysis/neural',
    config = function()
      require('neural').setup {
        source = {
          openai = {
            api_key = vim.env.OPENAI_API_KEY,
          },
        },
      }
    end,
  },


  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'json',
          'query',
          'tsx',
          'yaml',
          'c',
          'html',
          'javascript',
          'lua',
          'cpp',
          'go',
          'lua',
          'python',
          'rust',
          'typescript',
          'vimdoc',
          'vim',
          'regex',
          'bash',
          'css',
          'scss',
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,

        highlight = {
          enable = true,

          ------------------------------------------------------------------------------
          -- !!! THIS IS WHAT MAKES MARKDOWN HEADINGS H1 ABLE TO BE DIFFERENT COLORS: !!
          ------------------------------------------------------------------------------
          disable = { "markdown" },

          additional_vim_regex_highlighting = false,
        },
      }
    end
  },


  -- Lsp-Zero and Luasnip
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip',
        config = function ()
          require('luasnip.loaders.from_vscode').load({
            paths = { '~/.config/nvim/snippets' }
          })
        end
      },

      -- currently using default triggers:
      -- Tab / arrows => move down snippet list
      -- Enter => accept snippet
      -- Arrow => get out of auto selection of 1st snippet
      -- move thru snippet with <C-j,k> & <Shift-C-j,k>
    }
  },

}
