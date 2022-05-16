" colorscheme                                                                                                        
set background=dark                                                                                                  
let g:gruvbox_contrast_dark='hard'                                                                                  
colorscheme gruvbox                                                                                                  

" nerdtree                                                                                                          
nmap <leader>] :NERDTreeToggle<CR>                                                                                  
nmap <leader>\ :NERDTreeFocus<CR>                                                                                    

" google vim-codefmt
nnoremap ff :FormatCode<CR>

" airline theme
let g:airline_theme='deus'

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|.cache'

" coq
let g:coq_settings = {
    \ 'auto_start': v:true,
    \ 'display.icons.mode': 'none',
    \ 'keymap.jump_to_mark': '<c-y>',
    \}

" vim local                                                                                                          
set expandtab                                                                                                        
set tabstop=2                                                                                                        
set softtabstop=2                                                                                                    
set shiftwidth=2                                                                                                    
set t_Co=256                                                                                                        
set number
set autoindent
set is hls
set backspace=indent,eol,start
set pastetoggle=<F2>
set ignorecase
set smartcase
syntax on
filetype plugin indent on
packloadall

nnoremap <C-J> <C-W><C-J>                                                                                            
nnoremap <C-K> <C-W><C-K>                                                                                            
nnoremap <C-L> <C-W><C-L>                                                                                            
nnoremap <C-H> <C-W><C-H>  
