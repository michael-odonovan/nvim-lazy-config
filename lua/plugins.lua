-- local nightfly = require('lualine.themes.nightfly')
-- nightfly.normal.c.bg = 'None'

return {

  -----------------------------------------
  ----------- NEW -------------------------
  -----------------------------------------

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Undo Tree
  'mbbill/undotree',


  {
    'akinsho/toggleterm.nvim',
    config = function() require'toggleterm'.setup() end
  },


  -----------------------------------------
  ----------- STABLE ----------------------
  -----------------------------------------

  -- git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb', -- :GBrowse
  'kdheepak/lazygit.nvim',


  -- colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },


  -- telescope
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


  -- which-key
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

  -- colorizer
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
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

  -- IMPROVED TEXT EDITING
  -- autopairs
  {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  },

  -- trouble
  {
    'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
  },

  'lukas-reineke/indent-blankline.nvim',

  'davidgranstrom/nvim-markdown-preview',

  'kyazdani42/nvim-web-devicons',

  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  },

  {
    'kylechui/nvim-surround',
    tag = '*',
    config = function() require('nvim-surround').setup() end
  },

  'mattn/emmet-vim', -- <C-y,> real quick

  -- makes it able to to repeat vim-surround functions
  { 'tpope/vim-repeat', event = 'VeryLazy' },

  -- adds shortcuts for highlighting inner jsx tags
  'michaeljsmith/vim-indent-object',

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

  'theprimeagen/harpoon',


  {
    -- Highlight, edit, and navigate code
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
          'markdown',
          'markdown_inline',
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

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },

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
