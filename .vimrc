
set nu! "行号显示
set nocompatible "关了兼容模式
filetype on "文件类型侦测
filetype plugin on " 载入文件类型插件 
filetype indent on " 为特定文件类型载入相关缩进文件
set autoindent "自动缩进
set smartindent "只能缩进
colorscheme jellybeans
"高亮区
syntax on "语法高亮
set cursorline "高亮当前行
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配
" jellybeans下的高亮
let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
\              'attr': 'bold' },
\}

"字体的设置
set columns=80 lines=40    "设置gui默认界面大小
set guifont=Monaco:h16 "字体
set shortmess=atIi " 启动的时候不显示那个援助索马里儿童的提示 

" 我的状态行显示的内容（包括文件类型和解码）
set laststatus=3 "状态行必须有
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")} 

" 统一缩进为4 
set tabstop=4 "让一个tab等于4个空格
set softtabstop=4 
set shiftwidth=4 

" 在c,c++,python文件中用空格代替制表符
autocmd FileType c,cpp,python set shiftwidth=4 | set expandtab


""""""""""""""""""括号区""""""""""""""
" 括号自动补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i

" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
""""""""""""""""""""""""""""""""""""""

" 自动保存和载入
set autowrite "自动存
set autoread " 设置当文件被改动时自动载入
set confirm " 在处理未保存或只读文件的时候，弹出确~/.vim/colors/认


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" C,C++,Java,Python按F5编译运行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'python'
        exec "!python %"
    endif
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.py,*.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle() 

    " 如果文件类型为.sh文件
    if &filetype == 'sh' 
        call setline(1,
        "\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: Hat_Cloud") 
        call append(line(".")+2, "\# mail: jijianfeng529@gmail.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%F %R")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 

    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Hat_Cloud") 
        call append(line(".")+2, "    > Mail: jijianfeng529@gmail.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%F %R")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'python'
        call append(line(".")+5, "\#!/usr/bin/env python") 
        call append(line(".")+6, "\#coding: utf-8") 
        call append(line(".")+7, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    " 新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


""""""""""""""""""插件相关"""""""""""""""""""""""""""""""""""""""""""
"```Bundle setup
   set nocompatible              " be iMproved, required
   filetype off                  " required

   " set the runtime path to include Vundle and initialize
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  Plugin 'L9'
  " Git plugin not hosted on GitHub
  Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Avoid a name conflict with L9
  Plugin 'user/L9', {'name': 'newL9'}

 

   """""""Bundle List""""""
	Bundle 'HTML5-Syntax-File'
	Bundle 'WinManager'
	Bundle 'omnicppcomplete'
	Bundle 'NERD_commenter'
	Bundle 'vim-bling'
	Bundle 'LaTeX-Box-Team/LaTeX-Box' 
	Bundle 'davidhalter/jedi-vim'
	Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'


   " All of your Plugins must be added before the following line
   call vundle#end()            " required
   filetype plugin indent on    " required
   " To ignore plugin indent changes, instead use:
   "filetype plugin on
   "
   " Brief help
   " :PluginList       - lists configured plugins
   " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
   " :PluginSearch foo - searches for foo; append `!` to refresh local cache
   " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
   "
   " see :h vundle for more details or wiki for FAQ
   " Put your non-Plugin stuff after this line





""""ctags使用""""""""
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
"set tags=
"set tags=E:\workplace\tags
"set tags=D:\Program\ Files\Vim\vim74\tags
set tags=tags
set autochdir


""""taglist"""""
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
map <F2> :TlistToggle<CR>
"let Tlist_Auto_Open=0 "默认打开Taglist 
""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Show_One_File = 1         "只显示当前文件的taglist，默认是显示多个
"let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
nnoremap <leader>tl : Tlist<CR>        "设置关闭和打开taglist窗口的快捷键



" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"NERDTree提供了丰富的键盘操作方式来浏览和打开文件，我简单介绍一些常用的快捷键：

"" 和编辑文件一样，通过h j k l移动光标定位
" o 打开关闭文件或者目录，如果是文件的话，光标出现在打开的文件中
" go 效果同上，不过光标保持在文件目录里，类似预览文件内容的功能
" i和s可以水平分割或纵向分割窗口打开文件，前面加g类似go的功能
" t 在标签页中打开
" T 在后台标签页中打开
" p 到上层目录
" P 到根目录
" K 到同目录第一个节点
" J 到同目录最后一个节点
" m 显示文件系统菜单（添加、删除、移动操作）
" ? 帮助
" q 关闭
 
""""minibuff
 let g:miniBufExplMapWindowNavVim = 1 
  let g:miniBufExplMapWindowNavArrows = 1 
  let g:miniBufExplMapCTabSwitchBufs = 1 
  let g:miniBufExplModSelTarget = 1 


