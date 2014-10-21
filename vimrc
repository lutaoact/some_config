"Configured By Lu Tao 2013-08-15
syntax on
set nocompatible
let loaded_matchparen = 1
set encoding=utf-8
set nu
set enc=utf-8
set fencs=utf-8,gb2312,euc-jp,shift-jis
set noswapfile
set laststatus=2
set tabstop=2
set shiftwidth=2
set ruler
set showcmd
set showmatch
set cmdheight=3
" set cursorline
set wildmenu
set wildignore+=*/budweiser/client/*,*/node_modules/*,*/budweiser/server/test/*.js,*/budweiser/server/api/*.js,*.map,*.less,*.css,*/bower_components/* " for ctrlp.vim
autocmd InsertLeave * se cul
set incsearch
set hlsearch
set expandtab
set smarttab
set smartindent
set showtabline=2
set autoindent
set cindent
set clipboard=unnamed
" set statusline=\ [File]\ %F%m%r%h\ %w\ \ %h\ \%=[Line]\ %l,%c\ %=\ %P
set statusline=\ [File]\ %F%m%r%h\ %w\ \ %h\ [%{&ff}]\ [%{&fenc}\ %{&bomb}]\ [%b\ %B]\ \%=[Line]\ %l,%c\ %=\ %P
set whichwrap=b,s,<,>,[,],h,l "Allow move the cursor left/right to move to the previous/next line
set list listchars=tab:>-,trail:_
set foldmethod=marker
" set path=~/BoxsterServer/app/**,~/BoxsterServer/lib/**,~/BoxsterServer/script/**
set suffixesadd=.js
set keywordprg=:help
set backspace=2
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
hi Comment ctermfg=6
"===============
"Mappings
"===============
map <F2> :call JsBeautify()<CR>
map <F3> :!node %<CR>
map <F4> :!perl %<CR>
map <F5> :tabp<CR>
map <F6> :tabn<CR>
map <F7> :!run %<CR>
map <F8> <ESC>:!perl -c %<CR>
map <F9> :!coffee %<CR>
nmap <F10> :%s/<C-R>//<C-R>"/g<CR>
nmap gf <C-W>gf

nmap <Tab> v>
nmap <S-Tab> v<
vmap <Tab> >gv
vmap <S-Tab> <gv
iab ffff <C-R>=expand("%:t")<CR>
iab fff <C-R>=expand("%:t:r")<CR>

" " git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" filetype off
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
" 
" " let Vundle manage Vundle
" " required!
" Bundle 'gmarik/vundle'
" Bundle 'maksimr/vim-jsbeautify'
" Bundle 'einars/js-beautify'
" Bundle 'elzr/vim-json'
" Bundle 'vim-scripts/AutoComplPop'
" Bundle 'motemen/git-vim'
" Bundle 'vim-scripts/mru.vim'
" Bundle 'scrooloose/nerdtree'
" 
" " My bundles here:
" "
" " original repos on GitHub
" " Bundle 'tpope/vim-fugitive'
" " Bundle 'Lokaltog/vim-easymotion'
" " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Bundle 'tpope/vim-rails.git'
" " vim-scripts repos
" " Bundle 'L9'
" " Bundle 'FuzzyFinder'
" " non-GitHub repos
" " Bundle 'git://git.wincent.com/command-t.git'
" " Git repos on your local machine (i.e. when working on your own plugin)
" " Bundle 'file:///Users/gmarik/path/to/plugin'
" 
" filetype plugin indent on     " required!
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.cgi set filetype=perl
au BufRead,BufNewFile *.gyp set filetype=js
" au BufEnter /private/tmp/crontab.* setl backupcopy=yes
