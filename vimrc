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
set cursorline
set wildmenu
set wildignore+=*/maui/server/utils/*.js,*/maui/server/common/*.js,*/gale_client/node_modules/gulp*,*/wechatY/node_modules/*,*/gale/node_modules/*,*/maui/node_modules/*,*/budweiser/node_modules/*,*/budweiser/server/test/*.js,*/maui/server/api/*.js,*/budweiser/server/api/*.js,*.map,*.less,*.css,*/bower_components/*,*.scss " for ctrlp.vim
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
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
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

autocmd FileType java set sw=4
autocmd FileType java set ts=4
autocmd FileType java set sts=4

au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.jade set filetype=html
au BufRead,BufNewFile *.cgi set filetype=perl
au BufRead,BufNewFile *.gyp set filetype=js
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
