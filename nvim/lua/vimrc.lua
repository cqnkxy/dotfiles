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

-- Google vim-codefmt
vim.api.nvim_set_keymap('n', 'ff', ':FormatCode<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'fl', ':FormatLines<CR>', { noremap = true, silent = true })

-- Rainbow Parentheses
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  command = 'RainbowParentheses'
})
vim.g.rainbow_pairs = {{ '(', ')' }, { '[', ']' }, { '{', '}' }}

-- Airline theme
vim.g.airline_theme = 'deus'

-- CtrlP
vim.g.ctrlp_custom_ignore = 'node_modules\\|DS_Store\\|git\\|.cache\\|dist'
vim.g.ctrlp_working_path_mode = 'r'

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
