set nocompatible

" colorscheme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" nerdtree
nmap <leader>] :NERDTreeToggle<CR>
nmap <leader>\ :NERDTreeFocus<CR>
let g:NERDTreeIgnore = ['^bazel-.*', '^node_modules$']

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

" indent-blankline
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

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
hi Search cterm=NONE ctermfg=white ctermbg=darkblue
syntax on
filetype plugin indent on
packloadall
set tabstop=2 sw=2 expandtab smarttab softtabstop=2
" show tab as '| '.
set list lcs=tab:\|\

" treat visually wrapped line as a separate line when moving cursor
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'
noremap <expr> $ v:count ? '$' : 'g$'
noremap <expr> 0 v:count ? '0' : 'g0'
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
