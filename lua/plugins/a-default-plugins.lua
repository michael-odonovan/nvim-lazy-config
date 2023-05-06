return {

  { 'tpope/vim-fugitive' },

  { 'kdheepak/lazygit.nvim' },

  { 'tpope/vim-rhubarb' },

  {
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

  { "mbbill/undotree" },

  { "L3MON4D3/LuaSnip",
  -- require("luasnip.loaders.from_vscode").load({
    -- paths = { "~/.config/nvim/snippets" }
  -- })
  }

}
