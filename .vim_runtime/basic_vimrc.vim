"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen
let s:vim_runtime = expand('<sfile>:p:h')."/"
call pathogen#infect(s:vim_runtime.'vbundle/{}')
call pathogen#helptags()

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable 

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencodings=ucs-bom,utf-8,default,latin1
set fileencoding=utf8
set termencoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cdw :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2
" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ \ \ \ Line:\ %l\ \ Column:\ %c

" Remap VIM 0 to first non-blank character
map 0 ^

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>eb :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Set font according to system
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Fast editing and reloading of vimrc configs
autocmd! bufwritepost ~/.vim_runtime/basic_vimrc.vim source ~/.vim_runtime/basic_vimrc.vim

" Turn persistent undo on 
set undodir=~/.vim_runtime/undodir
set undofile

cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" 快捷输入example
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

"  Vim grep
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

" Always show the tablilne 
set stal=2

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => my_config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示行号
set number 

" 无需存盘就可以从文件切换出去 
set hidden 

" %%获得当前文件
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%') : '%%' 
" 获取当前路径
cnoremap <expr> %h getcmdtype( ) == ':' ? expand('%:h').'/' : '%h' 

" 视觉上下行
noremap j gj
noremap k gk

" 水平线
set cursorline

"gtags 设置项
" 使用 cscope 作为 tags 命令
set cscopetag
" 使用 gtags-cscope 代替 cscope
set cscopeprg="gtags-cscope" 

" 告诉gtags对远程支持的6中语音使用native分析器,对其它语言使用pygments
let $GTAGSLABEL = 'native-pygments'
" 注意这里得用绝对路径，不能用${HOME}，这是.sh
let $GTAGSCONF = '/home/huangxing02/install/share/gtags/gtags.conf'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
nmap <leader>tb :TagbarToggle<CR>

" ^gutentags

" 错误排查
let g:gutentags_define_advanced_commands = 1

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

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

" 配置 ctags 的参数, 老的Exuberant-ctags不能有--extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args = ['--fields=+niazS']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行, 老的Exuberant-ctags不能有output-format
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
" 禁用原始的key_map, 下面自己定义
let g:gutentags_plus_nomap = 1
" 查找引用 reference, 比c的范围更大，包括了函数定义
noremap <silent> <leader>cr :GscopeFind s <C-R><C-W><cr>
" 查找定义 define
noremap <silent> <leader>cd :GscopeFind g <C-R><C-W><cr>
" 查找调用该函数的函数 call
noremap <silent> <leader>cc :GscopeFind c <C-R><C-W><cr>
" 搜索光标下
noremap <silent> <leader>ce :GscopeFind e <C-R><C-W><cr>
" 查找该文件位置
noremap <silent> <leader>cp :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" 查找包含该头文件的文件
noremap <silent> <leader>ci :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" 查找变量赋值地方
noremap <silent> <leader>ca :GscopeFind a <C-R><C-W><cr>
" $gutentags配置

" terminal-help
tnoremap <C-H> <c-\><c-n><c-w>h
tnoremap <C-L> <c-\><c-n><c-w>l
tnoremap <C-J> <c-\><c-n><c-w>j
tnoremap <C-K> <c-\><c-n><c-w>k
tnoremap <C-q> <c-\><c-n>
tnoremap <C--> <c-\><c-n>"0pa
nnoremap <silent><C-t> :call TerminalToggle()<cr>
tnoremap <silent><C-t> <c-\><c-n>:call TerminalToggle()<cr>

" Ack

" Open Ack and put the cursor in the right position
map <leader>g :Ack!<Space>

" YankStack
let g:yankstack_yank_keys = ['y', 'd']
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

" CTRL-P
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>
map <C-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" Nerd Tree
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" Ale (syntax checker and linter)
" let g:ale_linters = {
" \   'javascript': ['jshint'],
" \   'python': ['flake8'],
" \   'go': ['go', 'golint', 'errcheck']
" \}

" nmap <silent> <leader>a <Plug>(ale_next_wrap)

" preview
autocmd FileType qf nnoremap <silent><buffer> o :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> O :PreviewClose<cr>
noremap <leader>ps :PreviewSignature!<cr>
inoremap <leader>ps <c-\><c-o>:PreviewSignature!<cr>

" ycm
highlight PMenu ctermfg=0 ctermbg=242
highlight PMenuSel ctermfg=242 ctermbg=8
" let g:ycm_filetype_whitelist = { 
" 			\ "c":1,
" 			\ "cpp":1, 
" 			\ "sh":1,
" 			\ "zsh":1,
" 			\ "lua":1,
" 			\ "go":1,
" 			\ "py":1,
" 			\ }

" tagbar
nmap <leader>tb :TagbarToggle<CR>

" Colorscheme
set background=dark
set t_Co=256
colorscheme molokai
" colorscheme desert

" surround
nmap rs  <Plug>Csurround

" air-line
" 状态栏
" 不要文件名
let g:airline_section_c = ""
" 不要文件类型
let g:airline_section_x = ""
let g:airline_section_warning = ""
let g:airline_section_error = ""
" 窗口小的时候不要文件编码
if airline#util#winwidth() > 79
    let g:airline_section_y = airline#section#create_right(['ffenc'])
else
	let g:airline_section_y = ""
endif
let g:airline_section_z = airline#section#create(['%3p%%'])
" tab栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_splits = 0
