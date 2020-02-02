let mapleader=";"

set nocompatible
filetype on
syntax on

set nu
set ruler
set showcmd
set hlsearch
set incsearch
set cindent
"set cmdheight=2
set backspace=indent,eol,start
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight WhitespaceEOL ctermbg=red guibg=red 
match WhitespaceEOL /\s\+$/

" set <Tab>
set ts=4
set sw=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent

set nobackup
if version >= 603
  set helplang=cn
  set encoding=utf-8
endif

set completeopt=preview,menu

" set W Q do same thing as w q
cabb W w
cabb Q q
cabb Wq wq
cabb WQ wq

set ignorecase

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'rhysd/vim-clang-format'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex'}
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
" 插件列表结束
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Folder
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
" set foldmethod=syntax
" close code fold when openning file
set nofoldenable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set t_Co=256
" set color of terminal is transparent
" let g:solarized_termtrans = 1
" set background=dark
" colorscheme solarized
" colorscheme molokai
""colorscheme phd

" 高亮显示当前行/列
set cursorline
set cursorcolumn


"  随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 总是显示状态栏
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline (set states bar)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置状态栏主题风格
" let g:Powerline_colorscheme='solarized'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" global config file, it will be overrided by local compile json
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" set fixit hot key 
nmap <leader>f :YcmCompleter FixIt<CR>
nmap <leader>j :YcmCompleter GoTo<CR>
nmap <leader>b :YcmCompleter GoToDefinition<CR>
let g:ycm_max_diagnostics_to_display = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clang format(http://clang.llvm.org/docs/ClangFormat.html#vim-integration)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use ; + f in NORMAL Model 
" map <leader>f :py3f  /usr/share/clang/clang-format-3.8/clang-format.py<cr>
" use ; + f in INSERT Model
" imap <leader>f <c-o>:py3f  /usr/share/clang/clang-format-3.8/clang-format.py<cr>
" set clang-format range to all file
function FormatFile()
  let l:lines="all"
  py3f /usr/share/clang/clang-format-3.8/clang-format.py
endfunction  
" aotu format when leave INSERT Model
"let g:clang_format#auto_format_on_insert_leave=1
let g:clang_format#auto_format=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Brackers setting
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree setting
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F3 to show file tree
map <F3> :NERDTreeMirror<CR>
" F3 to hide file tree
map <F3> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex previewer
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:livepreview_engine = 'xelatex'
autocmd FileType tex setl updatetime=100

" set width of column
let &colorcolumn=80

" doxygen setting
let g:DoxygenToolkit_authorName = "Shengfa Zhu <zhushengfa@sensetime.com>"
let g:DoxygenToolkit_licenseTag="\<enter>Copyright (C) 2019 by SenseTime Group Limited. All rights reserved.\<enter>Shengfa Zhu <zhushengfa@sensetime.com>"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_briefTag_funcName = "yes"

" Ultisnips setting
let g:UltiSnipsSnippetDirectories=["mysnippets"] 
let g:UltiSnipsExpandTrigger="<leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
