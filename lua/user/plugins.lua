-- local nightfly = require('lualine.themes.nightfly')
-- nightfly.normal.c.bg = 'None'

return {

  -----------------------------------------
  ---------------- NEW --------------------
  -----------------------------------------

  -- Undo Tree
  'mbbill/undotree',


  -- TODO
  -- HACK
  -- WARN
  -- PERF
  -- NOTE
  -- TEST
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },


  -----------------------------------------
  -------------- STABLE -------------------
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
          layout_strategy = 'vertical',
          layout_config = { height = 0.999, width = 0.999 }
        },
      }
    end,
  },


  -- Harpoon
  'theprimeagen/harpoon',

  -- Marks
  {
    'chentoast/marks.nvim',
    config = function() require('marks').setup() end
  },

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
  -- Surrounding
  -- ys$"
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup() end
  },
  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  },

  -- Comments
  {
    'numToStr/Comment.nvim',
    config = function()
      -- this makes it work with the jsx comment plugin
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  },
  -- sorts jsx comments
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },

  -- smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
    require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil,        -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil,              -- Function to run after the scrolling animation ends
          })
    end
  },

  -- Emmet =>  <C-y>,  real quick
  'mattn/emmet-vim',

  -- Indent Group Selecting
  'michaeljsmith/vim-indent-object',

  -- Lorem Ipsum generating
  'derektata/lorem.nvim',

  -- deleting buffers
  -- <leader>bd
  'kazhala/close-buffers.nvim',

  -- edit quickfix window => search and replace plugin
  -- :vimgrep searchExample *
  -- :copen
  -- use :%s/... and then :w
  'stefandtw/quickfix-reflector.vim',

  -- Trouble
  -- <leader>tr
  {
    'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
  },

  -- indent guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {
        indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      }
    }
  },

  -- markdown preview
  'davidgranstrom/nvim-markdown-preview',

  -- icons
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
  -- needs this line is in .zshrc:
  -- source "$HOME/.openai_key.zsh"
  -- and needs that file on my system at that path, obv


  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',

    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,

    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'json', 'query', 'tsx', 'yaml', 'c', 'html', 'javascript', 'lua', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'vimdoc', 'vim', 'regex', 'bash', 'css', 'scss',
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,

        context_commentstring = {
          enable = true,
        },

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
