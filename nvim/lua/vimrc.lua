-- Disable compatibility with vi
vim.o.compatible = false

-- Colorscheme
vim.o.background = 'dark'
-- vim.g.gruvbox_contrast_dark = 'hard'
-- vim.cmd('colorscheme gruvbox')

-- 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
vim.g.material_theme_style =  'darker-community'
vim.cmd('colorscheme material')

-- lualine
require('lualine').setup()

-- treesitter config
-- https://github.com/nvim-treesitter/nvim-treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "go", "python", "javascript", "typescript", "tsx", "markdown", "markdown_inline", "yaml", "proto" },

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

-- NERDTree
vim.api.nvim_set_keymap('n', '<leader>]', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>\\', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.g.NERDTreeIgnore = { '^bazel-.*', '^node_modules$' }
vim.g.NERDTreeWinSize = '50'

-- Google vim-codefmt
vim.api.nvim_set_keymap('n', 'ff', ':FormatCode<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'fl', ':FormatLines<CR>', { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('n', '<C-P>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-]>', ':Telescope find_files<CR>', { noremap = true, silent = true })

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
vim.opt.listchars:append "eol:↵"
vim.opt.listchars:append "tab:| "
vim.opt.listchars:append "space:·"

require('mini.indentscope').setup({
  draw = {
    -- Delay (in ms) between event and start of drawing scope indicator
    delay = 0,

    -- Animation rule for scope's first drawing. A function which, given
    -- next and total step numbers, returns wait time (in ms). See
    -- |MiniIndentscope.gen_animation| for builtin options. To disable
    -- animation, use `require('mini.indentscope').gen_animation.none()`.
    animation = function(s, n) return 5 end,

    -- Symbol priority. Increase to display on top of more symbols.
    priority = 2,
  },
   options = {
    -- Type of scope's border: which line(s) with smaller indent to
    -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    border = 'both',

    -- Whether to use cursor column when computing reference indent.
    -- Useful to see incremental scopes with horizontal cursor movements.
    indent_at_cursor = true,

    -- Whether to first check input line to be a border of adjacent scope.
    -- Use it if you want to place cursor on function header to get scope of
    -- its body.
    try_as_border = true,
  },
})
