
return {
  "iamcco/markdown-preview.nvim",
  -- enabled = false,
  build = "cd app && npm install",
  config = function()
    vim.g.mkdp_filetypes = {
      "markdown"
    }
  end,
}
