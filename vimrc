" Configured By Lu Tao 2013-08-15
syntax on
set nocompatible
let loaded_matchparen = 1
set encoding=utf-8
set number
" set relativenumber
set enc=utf-8
set fencs=utf-8,gb2312,euc-jp,shift-jis
set noswapfile
set laststatus=2
set tabstop=4
set shiftwidth=4
set ruler
set showcmd
set showmatch
set cmdheight=3
set cursorline
" set nocursorline
set wildmenu
" set wildignore+=*/maui/server/common/*.js,*/gale_client/node_modules/gulp*,*/Blackfyre/out/Blackfyre/*,*/blacktest/node_modules/*,*/Blackfyre/node_modules/*,*/gale/node_modules/*,*/maui/node_modules/*,*/budweiser/node_modules/*,*/budweiser/server/test/*.js,*/maui/server/api/*.js,*/budweiser/server/api/*.js,*.map,*.less,*.css,*/bower_components/*,*.scss " for ctrlp.vim

" ctrlp的忽略文件列表定义 \v是vim指令，用于打开very magic
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\/(node_modules|vendor)',
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

" 可视化显示tab和行尾的空格
set list listchars=tab:>-,trail:_

set foldmethod=marker
set suffixesadd=.js
set keywordprg=:help
set backspace=2
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
hi Comment ctermfg=6
" hi Search cterm=NONE ctermfg=grey ctermbg=blue

" Mappings
map <F2> :%!python -m json.tool<CR>
map <F3> :!node %<CR>
map <F4> :!go run %<CR>
map <F5> :tabp<CR>
map <F6> :tabn<CR>
" map <F7> :!sh %<CR>
" map <F8> <ESC>:!NODE_ENV=test mocha %<CR>
" map <F9> :!coffee %<CR>
nmap <F10> :%s/<C-R>//<C-R>"/g<CR>

" 实现文件跳转，默认从path指定的路径开始查找
set path=~/go/src
nmap gf <C-W>gf

nnoremap * *N
" visual模式下，用*搜索选中的文本，并高亮
vnoremap * y:let @/=@"<CR>nN

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" 插入模式下，成对符号的自动匹配
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>

" 选中上次操作过的文本片段
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" 使用<Tab>和<S-Tab>实现缩进，由于<TAB>键是ultisnips的默认触发键，所以会产生冲突
" 这里用 > 和 < 来替代
nnoremap > v>
nnoremap < v<
vnoremap > >gv
vnoremap < <gv

" 获取文件名
iab ffff <C-R>=expand("%:t")<CR>
iab fff <C-R>=expand("%:p")<CR>

" 用到的一些简写
iab hl {% highlight sh %}<CR>{% endhighlight %}<ESC>
" iab (e (err) => {<CR>}<ESC><<<<kf)h
" iab (r (req, res, next) => {<CR>}<ESC><<<<
" iab rg router.get('', );<ESC>F'h
" iab rp router.post('', );<ESC>F'h
" iab mm _u.mySeries({<CR>}, (err, ret) => {<CR>});<ESC><<<<k<<<<
" iab mn _u.mySeries({<CR>}, cb);<ESC><<<<
" iab (_ (_cb, ret) => {<CR>},<ESC>kf)
" iab (d (doc) => {<CR>}<ESC>
" iab ifc if (err) return cb(err);<ESC>k
" iab ifn if (err) return next(err);<ESC>k

" autocmd FileType java set sw=4
" autocmd FileType java set ts=4
" autocmd FileType java set sts=4

" au BufRead,BufNewFile *.ejs set filetype=html
" au BufRead,BufNewFile *.jade set filetype=html
" au BufRead,BufNewFile *.cgi set filetype=perl
" au BufRead,BufNewFile *.gyp set filetype=js
au BufRead,BufNewFile *.bashrc set filetype=sh
autocmd BufRead,BufNewFile **/etc/nginx/** setfiletype conf
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
autocmd BufRead,BufNewFile **eslintrc** setfiletype json
au BufNewFile,BufRead,BufWrite *.markdown set filetype=txt
au BufNewFile,BufRead,BufWrite *.markdown syntax match Comment /\%^---\_.\{-}---$/

autocmd BufWritePost */tmp/crontab.* w! /data/backup/crontab.conf

" ********************* 以下为go语言相关配置 *********************

" 不启用list模式，因为有fmt的存在，空白字符不需要可视化
autocmd FileType go set nolist

" tag用camelCase的方式显示，默认为snake_case
let g:go_addtags_transform = "camelcase"

" 在格式化的时候自动导入依赖包
let g:go_fmt_command = "goimports"

filetype plugin indent on " 让vim-go插件正常工作，打开文件类型探测功能，加载文件类型插件，使用文件类型的缩进方式

" ********************* 以上为go语言相关配置 *********************
