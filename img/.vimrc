set shell=/bin/bash

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on
"--------
" Vim UI
"--------
" color scheme
let g:solarized_termcolors=256
set background=dark
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE


" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search
set incsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
set t_BE=
" set relativenumber

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set textwidth=79
" set smarttab
set expandtab       " expand tab to space
"set noexpandtab
set clipboard+=unnamed

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js

" auto find tags
" set autochdir
" set tags=./.tags;,.tags
set tags=./tags;,tags
"-----------------
" Plugin settings
"-----------------
" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

let g:quickfix_is_open = 0

" vim asyncrun
let g:asyncrun_open = 8
" cmap tinamuboot AsyncRun -cwd=$TINA_BUILD_TOP  source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;muboot
:command -nargs=+ Tina :AsyncRun -cwd=$TINA_BUILD_TOP  source ~/.tina.sh; source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;"<args>"
" :command Muboot :AsyncRun -cwd=$TINA_BUILD_TOP  source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;muboot
" :command Muboot_nor :AsyncRun -cwd=$TINA_BUILD_TOP  source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;muboot_nor
" :command Mboot0 :AsyncRun -cwd=$TINA_BUILD_TOP  source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;muboot_nor

" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
let g:user_emmet_expandabbr_key='<C-j>'

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'
" SuperTab
let g:SuperTabCrMapping = 0
" let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

" ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0

" Keybindings for plugin toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
" Ack 代替grep搜索代码
nnoremap <leader>a :Ack
" 搜索当前光标所在单词
nnoremap <leader>aa yaw:Ack! <C-R>0<cr>
vnoremap <leader>aa y:Ack! <C-R>0<cr>
nnoremap <leader>bb yaw:grep <C-R>0 . -nrI<cr>
vnoremap <leader>bb y:grep <C-R>0 . -nrI<cr>

map <leader>aaa :Ack!<Space>
"高亮搜索关键词
let g:ackhighlight = 1
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"
"在QuickFix窗口使用快捷键以后，自动关闭QuickFix窗口
let g:ack_autoclose = 1
"使用ack的空白搜索，即不添加任何参数时对光标下的单词进行搜索，默认值为1，表示开启，置0以后使用空白搜索将返回错误信息
let g:ack_use_cword_for_empty_search = 1
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

nnoremap <leader>v V`]
" 内置grep搜索
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
"------------------
" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

" eggcache vim
" nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" for macvim
if has("gui_running")
    set go=aAce  " remove toolbar
    "set transparency=30
    set guifont=Monaco:h13
    set showtabline=2
    set columns=140
    set lines=40
    noremap <D-M-Left> :tabprevious<cr>
    noremap <D-M-Right> :tabnext<cr>
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
endif

" vim youdao translater
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>



cmap shanchukongge % s/[\s 　]\+$//g
map <leader><space> :FixWhitespace<cr>

" cmap xianshitab set listchars=tab:>-,trail:-
cmap xianshi set invlist
cmap buxianshi set nolist

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠


" Ctrl+j/k 切换标签页 +x 关闭标签页
map <C-J> :Tbbp<cr>
map <C-K> :Tbbn<cr>
map <C-X> :Tbbd<cr>

" 保存
map <C-S> :w
nnoremap <leader>ww :w<cr>
nnoremap <leader>wq :wq<cr>

" 显示十六进制
" 最好先用 vim -b xxx 打开文件
cmap hex %!xxd
cmap nohex %!xxd -r
cmap hexon %!xxd
cmap hexoff %!xxd -r

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.c = ['->', '.', '(', '[', '&']
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_seed_identifiers_with_syntax=1


"=============================================================================================
"set for YouCompleteMe
"=======begin=======
" 安装vundle后安装YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'
"设置<leader>的代表含义
let mapleader=";"
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files = 1
"设置快捷键映射 ;f 为 跳转到定义处
"nnoremap <leader>f :YcmCompleter GoToDeclaration<CR>
"nnoremap <C-n> :YcmCompleter GoToDeclaration<CR>
"设置快捷键映射 ;d 为 跳转到声明处
"nnoremap <C-m> :YcmCompleter GoToDefinition<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
"设置快捷键映射 ;g 为 跳转到定义和声明处
"nnoremap <C-g> :YcmCompleter GoTo<CR>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

nnoremap <leader>x :YcmCompleter FixIt<CR>
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 多跳转是显示列表
function s:CustomizeYcmQuickFixWindow()
    " Move the window at the top of the screen.
    execute "wincmd K"
    " Set the Window height to 5.
    execute "5wincmd _"
endfunction
autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()
"我靠,不要设置下面的内容,就可以实现用tab与s-tab选择自动补全列表
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']

"在错误行显示 >> 标志
let g:ycm_error_symbol = '>>'
"在警告行显示 >* 标志
let g:ycm_warning_symbol = '>*'
"设置快捷键映射 F4 为 显示编译的警告和错误信息
nmap <F4> :YcmDiags<CR>
"让Vim的补全菜单行为与一般IDE一致
"set completeopt=longest,menu
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>  pumvisible() ? "\<C-y>":"\<CR>"
"从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
"头文件补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"补全功能在注释中同样有效
let g:ycm_complete_in_comments = 1
"结构体，指针等元素的补全(. or ->)
let g:ycm_key_invoke_completion = '<C-Space>'
"允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
"默认加载的.ycm_extra_conf.py路径
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc = 0
"设置补全框前后景色
"Pmenu 是框色, PmenuSel是框内选中的选项颜色
"0-黑 1-红 2-绿 3-黄 4-蓝 5-浅紫 6-青 (其他数字没有尝试)
highlight Pmenu ctermfg=0 ctermbg=5
highlight PmenuSel ctermfg=0 ctermbg=3
"=======end : YouCompleteMe=======

" " YouCompleteMe 功能
" " 补全功能在注释中同样有效
" let g:ycm_complete_in_comments=0
" " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
" let g:ycm_confirm_extra_conf=0
" " 开启 YCM 基于标签引擎
" let g:ycm_collect_identifiers_from_tags_files=1
" " 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
" " set tags+=/data/misc/software/misc./vim/stdcpp.tags
" " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" inoremap <leader>; <C-x><C-o>
" " 补全内容不以分割子窗口形式出现，只显示补全列表
" " set completeopt-=preview
" " 从第二个键入字符就开始罗列匹配项
" let g:ycm_min_num_of_chars_for_completion=2
" " 禁止缓存匹配项，每次都重新生成匹配项
" let g:ycm_cache_omnifunc=0
" " 语法关键字补全
" let g:ycm_seed_identifiers_with_syntax=1
" " 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
" let g:ycm_key_invoke_completion = '<M-;>'

" set completeopt=longest,menu
" " 设置转到定义处的快捷键为ALT + G，这个功能非常赞
" nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" " 设置按哪个键上屏
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 调试用
let g:gutentags_define_advanced_commands = 1
let $GTAGSLABEL='native'

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" set termguicolors
" autocmd VimEnter *.md MarkdownPreview
    set encoding=UTF-8
    set langmenu=zh_CN.UTF-8
    language message zh_CN.UTF-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1	""这一句可以不加
    set fileencoding=utf-8
