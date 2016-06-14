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
set nocursorline
set wildmenu
" set wildignore+=*/maui/server/common/*.js,*/gale_client/node_modules/gulp*,*/Blackfyre/out/Blackfyre/*,*/blacktest/node_modules/*,*/Blackfyre/node_modules/*,*/gale/node_modules/*,*/maui/node_modules/*,*/budweiser/node_modules/*,*/budweiser/server/test/*.js,*/maui/server/api/*.js,*/budweiser/server/api/*.js,*.map,*.less,*.css,*/bower_components/*,*.scss " for ctrlp.vim
" ctrlp的忽略文件列表定义\v是vim指令，用于打开very magic
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\/(node_modules|bower|client|wind-cms\/public|wind-cms\/templates)',
  \ }
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
map <F2> :%!python -m json.tool<CR>
map <F3> :!node %<CR>
map <F4> :!perl %<CR>
map <F5> :tabp<CR>
map <F6> :tabn<CR>
map <F7> :!sh %<CR>
map <F8> <ESC>:!NODE_ENV=test mocha %<CR>
map <F9> :!coffee %<CR>
nmap <F10> :%s/<C-R>//<C-R>"/g<CR>
nmap gf <C-W>gf
nnoremap * *N
" visual模式下，用*搜索选中的文本，并高亮
vnoremap * y:let @/=@"<CR>nN

nmap <Tab> v>
nmap <S-Tab> v<
vmap <Tab> >gv
vmap <S-Tab> <gv
iab ffff <C-R>=expand("%:t")<CR>
iab fff <C-R>=expand("%:t:r")<CR><ESC>
iab hl {% highlight sh %}<CR>{% endhighlight %}<ESC>

autocmd FileType java set sw=4
autocmd FileType java set ts=4
autocmd FileType java set sts=4

au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.jade set filetype=html
au BufRead,BufNewFile *.cgi set filetype=perl
au BufRead,BufNewFile *.gyp set filetype=js
au BufRead,BufNewFile *.bashrc set filetype=sh
autocmd BufRead,BufNewFile **/etc/nginx/** setfiletype conf
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
autocmd BufRead,BufNewFile **eslintrc** setfiletype json
au BufNewFile,BufRead,BufWrite *.markdown set filetype=txt
au BufNewFile,BufRead,BufWrite *.markdown syntax match Comment /\%^---\_.\{-}---$/
