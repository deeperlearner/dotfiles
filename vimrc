syntax on

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" line
set number
set relativenumber
set nowrap
" tab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent " autoindent/smartindent
" others
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set backspace=indent,eol,start " 'backspace'
" search
" set ignorecase
" set smartcase
set incsearch
set hlsearch
" clipboard
set pastetoggle=<F2> " set paste
" mouse
set mouse=nv
map <F3> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>

" set clipboard=unnamedplus
" set mouse=a
source ~/.vim/tabline.vim
" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" [vim-pug](https://github.com/junegunn/vim-plug)
" automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" vim enhancement
" obsolete for vim 8.2.2345
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-obsession'

" file manager
" Plug 'francoiscabrol/ranger.vim'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'ctrlpvim/ctrlp.vim'

" coding enhancement
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-jedi
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'Vimjas/vim-python-pep8-indent'

" misc
" Plug 'easymotion/vim-easymotion'
" Plug 'vim-airline/vim-airline'

call plug#end()
" :w<CR>:so %<CR>
" :PlugClean
" :PlugInstall
" :PlugUpdate

colorscheme gruvbox
set background=dark
set t_ut=""
set term=screen-256color
set timeoutlen=1000 ttimeoutlen=50

let mapleader = " "

" nnoremap <leader>b :ls<CR>:b
" vertical colorcolumn
nnoremap <silent><leader>c :<C-u>let &l:cc = &l:cc =~# '[0-9]' ? '' : col('.')<CR>
" others
nnoremap <leader>l :redr!<CR>
nnoremap <leader>n :noh<CR>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" i_CTRL-V: Alt+<char> results in ^[<char>
execute "set <M-a>=a"
execute "set <M-e>=e"
execute "set <M-i>=i"
execute "set <M-o>=o"
execute "set <M-x>=x"
" number +/-
nnoremap <M-a> <C-a>
nnoremap <M-x> <C-x>
" jump forward/backward
nnoremap <M-o> <C-o>
nnoremap <M-i> <C-i>
" save change before deletions
inoremap <C-u> <C-g>u<C-u>
" inoremap <C-w> <C-g>u<C-w>
" home/end
inoremap <M-a> <C-o>0
inoremap <M-e> <C-o>$
" tabpage
nnoremap <Tab> gt
nnoremap <S-Tab> gT
" lineput
nnoremap <leader>p :pu<CR>
nnoremap <leader>P :pu!<CR>

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" plugin settings
" ctrlp.vim
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPBuffer'
nnoremap <leader>b :CtrlPBuffer<CR>

" coc.nvim
" let g:coc_disable_startup_warning = 1
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
" vim-surround
" e.g. yss-
" Code block for markdown
autocmd FileType markdown let b:surround_45 = "```\n\r\n```"
" Block comment for python
autocmd FileType python let b:surround_45 = "\"\"\"\n\r\n\"\"\""
" vim-commentary
" autocmd FileType <filetype> setlocal commentstring=#\ %s

" vim-easymotion
" map <BSlash> <Plug>(easymotion-prefix)
" " vim-airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " d/file.txt
" let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" let g:airline#extensions#tabline#buffer_idx_mode = 1 " buffer number

" :w<CR>:so %<CR>
