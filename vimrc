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
set tabstop=2
set shiftwidth=2
set ruler
set showcmd
set showmatch
set cmdheight=3
" set cursorline
set nocursorline
" set cursorcolumn
set wildmenu
" set wildignore+=*/maui/server/common/*.js,*/gale_client/node_modules/gulp*,*/Blackfyre/out/Blackfyre/*,*/blacktest/node_modules/*,*/Blackfyre/node_modules/*,*/gale/node_modules/*,*/maui/node_modules/*,*/budweiser/node_modules/*,*/budweiser/server/test/*.js,*/maui/server/api/*.js,*/budweiser/server/api/*.js,*.map,*.less,*.css,*/bower_components/*,*.scss " for ctrlp.vim

" ctrlp的忽略文件列表定义 \v是vim指令，用于打开very magic
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\/(node_modules|vendor|_site|frontend|qce/models|qce/client)',
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

set suffixesadd=.js
set keywordprg=:help
set backspace=2
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
hi Comment ctermfg=6
" hi Search cterm=NONE ctermfg=grey ctermbg=blue

" Mappings
nmap <F2> :%!python -m json.tool<CR>
nmap <F3> :!node %<CR>
nmap <F4> :!go run %<CR>
nmap <F5> :tabp<CR>
nmap <F6> :tabn<CR>
nmap <F7> :!./%<CR>
nmap <F8> :!python3 %<CR>
" map <F9> :!coffee %<CR>
nmap <F10> :%s/<C-R>//<C-R>"/g<CR>

" 实现文件跳转，默认从path指定的路径开始查找
set path=~/go/src,~/qiniu
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

" setlocal可以指定只对某一类文件处理
" autocmd FileType go setlocal shiftwidth=4 tabstop=4 sts=4
autocmd FileType java setlocal shiftwidth=4 tabstop=4 sts=4

" au BufRead,BufNewFile *.ejs set filetype=html
" au BufRead,BufNewFile *.jade set filetype=html
" au BufRead,BufNewFile *.cgi set filetype=perl
" au BufRead,BufNewFile *.gyp set filetype=js
au BufRead,BufNewFile *.bashrc set filetype=sh
autocmd BufRead,BufNewFile **/etc/nginx/** setfiletype conf
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
autocmd BufRead,BufNewFile **eslintrc** setfiletype json
au BufNewFile,BufRead,BufWrite *.markdown syntax match Comment /\%^---\_.\{-}---$/
au BufRead,BufNewFile *nginx*.conf,*/nginx/conf.d/*,*/nginx.conf.d/* if &ft == '' | setfiletype nginx | endif

autocmd BufWritePost */tmp/crontab.* w! /data/backup/crontab.conf


" ********************* 以下为go语言相关配置 *********************

" 不启用list模式，因为有fmt的存在，空白字符不需要可视化
autocmd FileType go set nolist

" tag用camelCase的方式显示，默认为snake_case
let g:go_addtags_transform = "camelcase"

" 在格式化的时候自动导入依赖包
let g:go_fmt_command = "goimports"

" 控制打开alternate file的方式，在这里是指go的test文件
" autocmd Filetype go command! -bang E call go#alternate#Switch(<bang>0, 'edit')
" autocmd Filetype go command! -bang S call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang V call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang T call go#alternate#Switch(<bang>0, 'tabe')

" 执行GoDef时跳转到新tab或者垂直分割窗口，默认的gd命令是直接在当前窗口中打开
au FileType go nmap dv <Plug>(go-def-vertical)
au FileType go nmap dt <Plug>(go-def-tab)

" 列出所有的标识符，默认包括func和type，可以通过以下配置项来修改
" let g:go_decls_includes = 'func,type'
" let g:go_decls_includes = 'func'
nmap <TAB> :GoDecls<CR>

" 列出godef的调用栈
nmap <C-L> :GoDefStack<CR>

filetype plugin indent on " 让vim-go插件正常工作，打开文件类型探测功能，加载文件类型插件，使用文件类型的缩进方式

" ********************* 以上为go语言相关配置 *********************

" let g:indentLine_char = '┆'
let g:indentLine_fileType = ['yaml', 'json']
