"ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

"设置tab为4个空格
set ts=4
set expandtab
filetype indent on

"解决crontab -e时，提示crontab: temp file must be edited in place
autocmd filetype crontab setlocal nobackup nowritebackup

"NERDTree
set runtimepath^=~/.vim/bundle/nerdtree
map <F4> :NERDTreeToggle<CR>

set runtimepath^=~/.vim/bundle/taglist.vim
map <F8> :TlistToggle<CR>

"按F5一键编译并运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
           exec "!gcc % -o   %<"
           exec "! ./%<"
        elseif &filetype == 'cpp'
           exec "!g++ % -std=c++11 -DLOCAL -Dxiaoai -o    %<"
           exec "!time ./%<"
        elseif &filetype == 'java'
           exec "!javac %"
           exec "!time java %<"
        elseif &filetype == 'sh'
           :!time bash %
        elseif &filetype == 'python'
        exec "!time python3.5 %"
        endif
endfunc

"Vdebug"
"set runtimepath^=~/.vim/bundle/vdebug
"let g:debuggerPort = 9010

"emmet"
set runtimepath^=~/.vim/bundle/emmet-vim

set runtimepath^=~/.vim/bundle/lightline.vim
"debugger
"set runtimepath^=~/.vim/bundle/debugger
"let g:debuggerPort = 9010


"主题颜色
syntax on
colorscheme industry 

"高亮行和列
set cursorline  
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorcolumn  
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white  

"自动缩进
set nu
set autoindent  
set tabstop=4  
set shiftwidth=4  
"set mouse=a

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" 状态栏
set laststatus=2      " 总是显示状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" 获取当前路径，将$HOME转化为~
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\


" c语言支持
source ~/.vim/c.vim

" 透明
hi Normal ctermfg=252 ctermbg=none
