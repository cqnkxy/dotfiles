return {
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" }, -- Modern replacement for vim-devicons

  -- LSP & Completion
  { "neovim/nvim-lspconfig" },
  { "ms-jpq/coq_nvim", branch = "coq" },
  { "ms-jpq/coq.artifacts", branch = "artifacts" },
  { "nvimtools/none-ls.nvim" }, -- Successor to null-ls
  { "mfussenegger/nvim-dap" },

  -- Telescope & Search
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Treesitter & UI
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ok, ts = pcall(require, 'nvim-treesitter.configs')
      if not ok then
        ok, ts = pcall(require, 'nvim-treesitter')
      end

      if ok then
        ts.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "tsx" },
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          indent = {
            enable = true,
            disable = { "php" },
          },
        })
      end
    end
  },

  { "echasnovski/mini.indentscope", version = "*" },
  { "nvim-lualine/lualine.nvim" },
  { "preservim/nerdtree" },
  { "tiagofumo/vim-nerdtree-syntax-highlight" },

  -- Themes
  { "sainnhe/sonokai" },
}
