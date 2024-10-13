-- Disable compatibility with vi
vim.o.compatible = false

-- Colorscheme
vim.o.background = 'dark'
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')

-- NERDTree
vim.api.nvim_set_keymap('n', '<leader>]', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>\\', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.g.NERDTreeIgnore = { '^bazel-.*', '^node_modules$' }
vim.g.NERDTreeWinSize = '50'

-- Google vim-codefmt
vim.api.nvim_set_keymap('n', 'ff', ':FormatCode<CR>', { noremap = true, silent = true })
-- Disable compatibility with vi
vim.o.compatible = false

-- Colorscheme
vim.o.background = 'dark'
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')

-- NERDTree
vim.api.nvim_set_keymap('n', '<leader>]', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>\\', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.g.NERDTreeIgnore = { '^bazel-.*', '^node_modules$' }
vim.g.NERDTreeWinSize = '50'

-- Google vim-codefmt
vim.api.nvim_set_keymap('n', 'ff', ':FormatCode<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'fl', ':FormatLines<CR>', { noremap = true, silent = true })

-- Rainbow Parentheses
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  command = 'RainbowParentheses'
})
vim.g.rainbow_pairs = {{ '(', ')' }, { '[', ']' }, { '{', '}' }}

-- telescope
vim.api.nvim_set_keymap('n', '<C-P>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-]>', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- Airline theme
vim.g.airline_theme = 'deus'

-- Coq
vim.g.coq_settings = {
  auto_start = 'shut-up',
  ['display.icons.mode'] = 'none',
  ['keymap.jump_to_mark'] = '<c-y>',
}

-- Vim local settings
vim.o.number = true
vim.o.autoindent = true
vim.o.hlsearch = true
vim.o.backspace = 'indent,eol,start'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.cmd('highlight IncSearch ctermfg=white ctermbg=black')
vim.cmd('highlight Search cterm=NONE ctermfg=white ctermbg=darkblue')
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('packloadall')
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.softtabstop = 2

-- Fold settings
vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 99
vim.api.nvim_create_autocmd({'BufReadPost', 'FileReadPost'}, {
  pattern = '*',
  command = 'normal zR'
})

-- Treat visually wrapped line as a separate line when moving cursor
vim.api.nvim_set_keymap('n', 'j', [[v:count ? 'j' : 'gj']], { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', [[v:count ? 'k' : 'gk']], { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', '$', [[v:count ? '$' : 'g$']], { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', '0', [[v:count ? '0' : 'g0']], { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true, silent = true })

-- indent and eol
vim.opt.list = true
vim.opt.listchars:append "eol:↲"
vim.opt.listchars:append "tab:| "
vim.opt.listchars:append "space:."
