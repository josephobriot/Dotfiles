"""""""""""""""""""""""
"         BASE        "
"""""""""""""""""""""""
set nocompatible
syntax on
set wrap
set breakindent
set breakindentopt=sbr
set showbreak=↪
set tabstop=4 shiftwidth=4 smarttab " Tabs have a size of 4 and are inserted as TABS YOU HERECTICS
set number
set mouse= " Don't allow mouse
set ruler " Display cursor
set cursorline cursorcolumn
set hlsearch " Highlighted search results
set showcmd " Display (partially) the command in the last line of the screen
set cmdheight=1
set backspace=indent,eol,start " Backspacing over every character in insert mode
set autoindent " auto indent
set smartindent
set ignorecase " Smart search
set foldmethod=indent
set foldlevel=0
set foldclose=all
set noshowmode " no status bar
set scrolloff=8
set splitbelow splitright
set timeoutlen=1000 ttimeoutlen=0 " remove escape delay

""""""""""""""""""""""""
" Vundle configuration "
""""""""""""""""""""""""

filetype off " Required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim " Load vundle

call vundle#begin()

Plugin 'gmarik/Vundle.vim' " Let Vundle manage itself

""" plugins

Plugin 'itchyny/lightline.vim'
Plugin 'francoiscabrol/ranger.vim'

call vundle#end()

filetype plugin indent on " Restore filetype detection



let g:lightline = {
     \ 'colorscheme': 'one',
     \ }

set laststatus=2



" Alt arrow to navigate
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Alt shift arrow to resize
nmap <A-S-Right> :vertical resize +10<CR>
nmap <A-S-Left> :vertical resize -10<CR>
nmap <A-S-Up> :resize +10<CR>
nmap <A-S-Down> :resize -10<CR>

" Alt nav to navigate
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" Alt shift nav to resize
nmap <A-S-l> :vertical resize +10<CR>
nmap <A-S-h> :vertical resize -10<CR>
nmap <A-S-k> :resize +10<CR>
nmap <A-S-j> :resize -10<CR>


" line up or down
nnoremap <C-A-Down> mz:m +1<CR>`z==
nnoremap <C-A-Up> mz:m -2<CR>`z==
inoremap <C-A-Down> <Esc>:m +1<CR>==gi
inoremap <C-A-Up> <Esc>:m -2<CR>==gi
vnoremap <C-A-Down> :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap <C-A-Up> :m'<-2<CR>gv=`>my`<mzgv`yo`z




autocmd ColorScheme janah highlight Normal guifg=#dadada ctermfg=253 guibg=#14161b gui=NONE cterm=NONE

autocmd ColorScheme janah highlight VertSplit guifg=#24262b ctermfg=237 guibg=#24262b ctermbg=237 gui=NONE cterm=NONE
autocmd ColorScheme janah highlight WildMenu guifg=#df005f ctermfg=161 guibg=#24262b ctermbg=237 gui=bold cterm=bold

autocmd ColorScheme janah highlight CursorColumn ctermfg=NONE guibg=#2e2e3a ctermbg=236 gui=NONE cterm=NONE
autocmd ColorScheme janah highlight CursorLine ctermfg=NONE guibg=#2e2e3a ctermbg=236 gui=NONE cterm=NONE

autocmd ColorScheme janah highlight StatusLine guifg=#e4e4e4 ctermfg=254 guibg=#24262b ctermbg=237 gui=NONE cterm=NONE
autocmd ColorScheme janah highlight StatusLineNC guifg=#808080 ctermfg=244 guibg=#24262b ctermbg=237 gui=NONE cterm=NONE

autocmd ColorScheme janah highlight CursorLineNr guifg=#878787 ctermfg=102 guibg=#24262b ctermbg=237 gui=NONE cterm=NONE
autocmd ColorScheme janah highlight LineNr guifg=#878787 ctermfg=102 guibg=#24262b ctermbg=237 gui=NONE cterm=NONE

autocmd ColorScheme janah highlight ColorColumn ctermfg=NONE guibg=#24262b ctermbg=237 gui=NONE cterm=NONE

autocmd ColorScheme janah highlight SignColumn ctermfg=NONE guibg=#24262b ctermbg=237 gui=NONE cterm=NONE

autocmd ColorScheme janah highlight FoldColumn ctermfg=102 ctermbg=237 cterm=NONE guifg=#878787 guibg=#24262b gui=NONE
autocmd ColorScheme janah highlight Folded ctermfg=102 ctermbg=237 cterm=NONE guifg=#878787 guibg=#24262b gui=NONE

" set termguicolors
set background=dark

colorscheme janah




"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Resize panes whenever containing window resized.
autocmd VimResized * wincmd =

" Better backup, swap and undos storage
set backup                        " make backup files
set undofile                      " persistent undos - undo after you re-open the file
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backupdir=~/.vim/dirs/backups " where to put backup files
set undodir=~/.vim/dirs/undodir   " undo directory


" Don't you f'in touch my cursor
set guicursor=

" Save as sudo
ca w!! w !sudo tee "%"
