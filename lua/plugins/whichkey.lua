
return {
  "folke/which-key.nvim",
  event = "BufWinEnter",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      plugins = {
        marks = false,
        registers = false,
        spelling = { enabled = false, suggestions = 20 },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
          z = false,
          g = false,
        },
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    -- local toggle_float = function()
    --   local float = Terminal:new({ direction = "float" })
    --   return float:toggle()
    -- end
    local toggle_lazygit = function()
      local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
      return lazygit:toggle()
    end

    local mappings = {
      q = { ":q!<cr>", "Quit" },
      C = { ":ChatGPT<cr>", "ChatGPT" },
      -- f = { ":lua vim.lsp.buf.format()<cr>", "Format" },
      -- w = { ":w<cr>", "Write" },
      w = { "<cmd>lua vim.lsp.buf.format()<CR><cmd>w!<CR>", "Format and Save" },
      x = { ":x<cr>", "Write & Quit" },
      c = { ":bdelete<cr>", "Close Buffer" },
      -- C = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },
      [" "] = { ":Telescope find_files<cr>", "Find Files" },
      F = { ":Telescope live_grep<cr>", "Find Text" },
      t = {
        name = "Terminal/ToDo/Trouble",
        f = { ":ToggleTerm direction=float<cr>", "Float" },
        b = { ":ToggleTerm size=10 direction=horizontal<cr>", "Below" },
        s = { ":ToggleTerm size=50 direction=vertical<cr>", "Side" },
        -- v = { ":vsplit<cr>", "Vertical Split" },
        -- h = { ":split<cr>", "Horizontal Split" },
      },
      l = {
        name = "LSP",
        -- f = { ":Format<cr>", "Format Toggle" },
        a = { ":Lspsaga code_action<cr>", "Code Action" },
        g = { toggle_lazygit, "LazyGit" },
        i = { ":LspInstall<cr>", "Install" },
        I = { ":LspInfo<cr>", "Info" },
        o = { ":Lspsaga outline<cr>", "Code Outline" },
        c = { ":Lspsaga incoming_calls<cr>", "Incoming Calls" },
        O = { ":Lspsaga outgoing_calls<cr>", "Outgoing Calls" },
        m = { ":Mason<cr>", "Mason Installer" },
        s = { '<cmd>lua require("persistence").load({ last = true })<cr>', "Last Session" },
        x = { '<cmd>lua require("persistence").load()<cr>', "Last Directory Session" },
        e = { '<cmd>lua require("persistence").stop()<cr>]', "End Last Session" },
        n = {
          ":Lspsaga diagnostic_jump_next<cr>",
          "Next Diagnostic",
        },
        k = {
          ":Lspsaga diagnostic_jump_prev<cr>",
          "Prev Diagnostic",
        },
        r = { ":Lspsaga rename<cr>", "Rename" },
        d = { ":Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
        w = { ":Telescope diagnostics<cr>", "Workspace Diagnostics" },
        t = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
        T = { ":Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
      },
      z = {
        name = "Focus",
        z = { ":ZenMode<cr>", "Toggle Zen Mode" },
        t = { ":Twilight<cr>", "Toggle Twilight" },
      },
    }

    local opts = { prefix = "<leader>" }

    require("which-key").register(mappings, opts)
  end,
}
