" plugins:
"  * nerdtree
"  * vim-airline
"  * indentLine
"  * gruvbox
"  * vim-slp
"  * async.vim
"  * rainbow parentheses https://github.com/junegunn/rainbow_parentheses.vim.git
"  * coq_vim https://github.com/ms-jpq/coq_nvim.git
set nocompatible

" colorscheme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" nerdtree
nmap <leader>] :NERDTreeToggle<CR>
nmap <leader>\ :NERDTreeFocus<CR>

" google vim-codefmt
nnoremap ff :FormatCode<CR>
xnoremap fl :FormatLines<CR>

" rainbow parentheses
au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" airline theme
let g:airline_theme='deus'

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|.cache\|dist'
let g:ctrlp_working_path_mode = 'r'

" coq
let g:coq_settings = {
    \ 'auto_start': 'shut-up',
    \ 'display.icons.mode': 'none',
    \ 'keymap.jump_to_mark': '<c-y>',
    \}

" vim local
set t_Co=256
set number
set autoindent
set is hls
set backspace=indent,eol,start
set pastetoggle=<F2>
set ignorecase
set smartcase
set nowrap
hi IncSearch ctermfg=white ctermbg=black
syntax on
filetype plugin indent on
packloadall
set tabstop=2 sw=2 expandtab smarttab softtabstop=2

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
