"
" Jamen's vim configuration file
"

"""""""""""""""
" 通用设置
"""""""""""""""
" 不使用vi的键盘模式，而是vim自己的
set nocompatible

" 语法高亮
syntax on

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 显示颜色
set t_Co=256

" 设置当文件被改动时自动载入
set autoread

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"代码补全：显示候选菜单，只有一个后选项也显示菜单，不自动选择第一个，自动补全最长公共前缀
set completeopt=menu,menuone,noselect,longest

"共享剪贴板
set clipboard=unnamed

"从不备份
set nobackup

"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏

" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent
set foldlevel=3
set foldenable              " 开始折叠

" 去掉输入错误的提示声音
set noeb

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 自动缩进
set autoindent
set cindent

" Tab键的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 用空格代替制表符
set expandtab

" 不要用空格代替制表符
" set noexpandtab

" 在行和段开始处使用制表符
set smarttab

" 显示行号，默认不开，开了会影响选中复制
" set number

" 历史记录数
set history=1000

"禁止生成临时文件
set nobackup
set noswapfile

"搜索忽略大小写
set ignorecase

"搜索逐字符高亮
set hlsearch
set incsearch

"行内替换
set gdefault

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

" 总是显示状态行
set laststatus=2

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 关闭鼠标功能，避免复制粘贴冲突
set mouse=

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 为C程序提供自动缩进
set smartindent

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

"""""""""""""""
" 键盘命令
"""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

"""""""""""""""
" 常用Tips
"""""""""""""""
" - 撤销u  重做ctrl+r
" - 移动到下个单词w 移动到词首b 移动到词尾e
" - 跳转首行gg 跳转尾行G 跳转指定行<number>gg 跳转上次编辑ctro+o
" - 选择模式v
" - 复制选中y 复制当前词yw 复制当前行yy 粘贴p
" - 括号配对 %
" - 查找光标所在词 *
" - 删除匹配行:g/pattern/d
" - 删除不匹配行:v/pattern/d
" - 删除重复行:g/^\(.*\)\n\1$/d
" - 删除全文:%d 或者ggdG
" - 排序后删除重复行:sort u
" - 列选择模式ctrl+v
" - 多行首添加ctrl+v I 输入内容后Esc
" - 多行尾添加ctrl+v $ A 输入内容后Esc
" - 重新获取sudo保存:w !sudo tee %
