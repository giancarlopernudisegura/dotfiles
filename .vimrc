" author: Giancarlo Pernudi Segura
" see https://giancarlopernudi.com
"        _
"       (_)
" __   ___ _ __ ____
" \ \ / / | '_ ` _  \
"  \ V /| | | | | | |
"   \_/ |_|_| |_| |_|

set encoding=utf-8
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab
set ignorecase
set background=dark

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins:
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mmai/vim-zenmode'
Plugin 'powerline/powerline'
Plugin 'tpenguinltg/vim-closing-brackets'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lervag/vimtex'
Plugin 'adelarsq/vim-matchit'
Plugin 'tpope/vim-ragtag'
Plugin 'lilydjwg/colorizer'

call vundle#end()


let g:mapLeader=" "
set encoding=utf-8
syntax on
filetype plugin on
set number relativenumber
set wildmode=longest,list,full
set mouse=a
set ruler
set splitbelow
set splitright
set cursorline
set updatetime=300
set formatoptions-=cro
set clipboard=unnamedplus
set t_Co=256
set wildmenu
vnoremap < <gv
vnoremap > >gv
au! BufWritePost $MYVIMRC source %

autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--save<return>
autocmd Filetype c map <F5> :!gcc<space>-Wall<space>-std=c99<space><c-r>%<space>-o<space><c-r>%<backspace><backspace><space>&&<space>./<c-r>%<backspace><backspace><return>
autocmd FileType c map <F2> i#include<space><stdio.h><return>#include<space><stdlib.h><return><return>int<space>main(int<space>argc,<space>char<space>**<space>argv)<space>{<return><tab>return<space>0;<Esc>4k
autocmd FileType md map <F5> :!okular<space><c-r>%<space>&<return><return>
autocmd FileType tex map <F5> :!pdflatex<space><c-r>%<space>&&<space>pkill<space>-HUP<space>mupdf<return><return>
autocmd FileType tex map <F4> :!mupdf<space><c-r>%<backspace><backspace><backspace>pdf<space>&<return><return>
map <F6> :!make<return><return>
map <TAB> :qa<CR>
map <Esc><Esc> :w<CR>
map t :NERDTree<CR>
map f :ZenmodeToggle<CR>
set autoindent
set cindent

" Zenmode:
let g:zenmode_background = "dark"
" let g:zenmode_colorscheme = "solarized"
let g:zenmode_font ="UbuntuMono Nerd Font Mono 12"
let g:zenmode_sidebar_height = 5

" Airline:
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#vimtex#enabled = 1

" gitgutter:
set updatetime=50
let g:gitgutter_terminal_reports_focus=0
set signcolumn=yes
let g:gitgutter_grep=''

" Indent Guides:
let g:indent_guides_enable_on_vim_startup = 1

" Coc
noremap <silent><expr> <TAB>
	\ pumvisible() ? coc#_select_confirm() :
	\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
