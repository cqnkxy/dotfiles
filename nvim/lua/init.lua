-- =============================================================================
-- 2. BOOTSTRAP LAZY.NVIM
-- =============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- 3. PLUGIN SETUP (Loads lua/plugins.lua)
-- =============================================================================
require("lazy").setup("plugins", {
  git = {
    timeout = 300,
    url_format = "https://github.com/%s.git",
  },
  ui = { border = "rounded" }
})

-- =============================================================================
-- 3. CORE VIM OPTIONS
-- =============================================================================
vim.o.background = 'dark'
vim.o.number = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.hlsearch = true
vim.o.backspace = 'indent,eol,start'
vim.o.ignorecase = true
vim.o.smartcase = true

-- Auto-reload files modified outside Neovim
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Tabs & Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.softtabstop = 2

-- Invisible characters (Indent & EOL)
vim.opt.list = true
vim.opt.listchars:append("eol:↩")
vim.opt.listchars:append("tab:| ")
vim.opt.listchars:append("space:·")

-- Folds
vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 99
vim.api.nvim_create_autocmd({'BufReadPost', 'FileReadPost'}, {
  pattern = '*',
  command = 'normal zR'
})

-- =============================================================================
-- 4. DIAGNOSTICS & UI CONFIG
-- =============================================================================
vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
  float = {
    border = "rounded",
  },
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
vim.cmd([[
  highlight! DiagnosticUnderlineInfo gui=underdotted
  highlight! DiagnosticUnderlineWarn gui=underdotted
  highlight! DiagnosticUnderlineError gui=underdotted
]])

-- =============================================================================
-- 5. THEMES & UI PLUGINS (Crash-proofed)
-- =============================================================================
pcall(vim.cmd, "colorscheme sonokai")

-- Lualine
local lualine_ok, lualine = pcall(require, 'lualine')
if lualine_ok then
  lualine.setup({
    options = { theme = 'auto' }
  })
end

-- Mini Indentscope
local mini_indent_ok, mini_indent = pcall(require, 'mini.indentscope')
if mini_indent_ok then
  mini_indent.setup({
    draw = {
      delay = 100,
      animation = function(s, n) return 5 end,
      priority = 2,
    },
    options = {
      border = 'both',
      indent_at_cursor = true,
      try_as_border = true,
    },
  })
end

-- =============================================================================
-- 6. KEYMAPS
-- =============================================================================

-- NERDTree
vim.keymap.set('n', '<leader>]', ':NERDTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>\\', ':NERDTreeFocus<CR>', { silent = true })
vim.keymap.set('n', '<leader>f', ':NERDTreeFind<CR>', { silent = true })
vim.g.NERDTreeWinSize = '50'

-- Telescope & Search Commands
vim.keymap.set('n', '<C-P>', '<cmd>Telescope myles<CR>', { silent = true })
vim.keymap.set('n', '<C-\\>', '<cmd>Telescope biggrep r<CR>', { silent = true })
vim.keymap.set('n', '<C-]>', '<cmd>Telescope buffers<CR>', { silent = true })

-- Treat visually wrapped line as a separate line when moving cursor
vim.keymap.set('n', 'j', [[v:count ? 'j' : 'gj']], { expr = true, silent = true })
vim.keymap.set('n', 'k', [[v:count ? 'k' : 'gk']], { expr = true, silent = true })
vim.keymap.set('n', '$', [[v:count ? '$' : 'g$']], { expr = true, silent = true })
vim.keymap.set('n', '0', [[v:count ? '0' : 'g0']], { expr = true, silent = true })

-- Window splits
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { silent = true })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { silent = true })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { silent = true })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { silent = true })

-- Yank to system clipboard
vim.keymap.set({'n', 'v'}, 'y', '"+y', { noremap = true })
vim.keymap.set('n', 'yy', '"+yy', { noremap = true })

-- =============================================================================
-- 7. TREESITTER & LANGUAGE SPECIFIC (Crash-proofed)
-- =============================================================================
-- Enable treesitter highlighting for languages with installed parsers
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- =============================================================================
-- 8. LSP, COQ (Modernized Neovim 0.11+ Native LSP)
-- =============================================================================

-- Coq settings
vim.g.coq_settings = {
  auto_start = true,
  ['keymap.jump_to_mark'] = '<c-y>',
}

local on_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

  -- Format on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
      end,
    })
  end
end

-- vim.lsp.log.set_level("debug")

local servers = {"gopls", "pyright"}

-- Safely load Coq for capabilities
local coq_ok, coq = pcall(require, "coq")
local build_capabilities = coq_ok and coq.lsp_ensure_capabilities or function(opts) return opts end

-- Modern Native Server Setup Loop
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, build_capabilities({
    on_attach = on_attach,
  }))
  vim.lsp.enable(lsp)
end
