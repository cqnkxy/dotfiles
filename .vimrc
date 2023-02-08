" plugins:
"  * nerdtree
"  * vim-airline
"  * indentLine
"  * gruvbox
"  * vim-slp
"  * async.vim
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
set number
set autoindent
set is hls
set backspace=indent,eol,start
set pastetoggle=<F2>
set ignorecase
set smartcase
hi IncSearch ctermfg=white ctermbg=black
syntax on
filetype plugin indent on
packloadall
set tabstop=2 sw=2 expandtab smarttab softtabstop=2

" treat visually wrapped line as a separate line when moving cursor
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
