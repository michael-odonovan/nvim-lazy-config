
return {
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
}
