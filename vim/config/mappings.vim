let mapleader=','
let g:mapleader=','

" NORMAL MODE
inoremap jk <ESC>

" SEARCH HIGHLIGHTING OFF
nnoremap <silent> <LEADER><SPACE> :nohlsearch<CR>

" REFRESH SCREEN & SYNTAX HIGHLIGHTING
nnoremap <silent> <C-L> :redraw!<CR>:syntax sync fromstart<CR>

" RELOAD THE CURRENT FILE
nnoremap <silent> <LEADER>f :e!<CR>

" COMMA+ENTER GOES TO INSERT MODE
nnoremap ,<CR> A,<CR>

" INSERT AND FIND TODO(KJH)
inoremap <LEADER>t TODO(kjh):<SPACE>
nnoremap <silent> <LEADER>t :Rg TODO<CR>

" Highlight word without jump in normal mode
nnoremap * :keepjumps normal! mi*`i<CR>

" CHANGE TAG SPLIT MAPPINGS
nnoremap <silent> <C-W>] :sp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <silent> <C-W><C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" TAME THE HALF-PAGE SCROLLER
nnoremap <C-D> 5j5<C-E>
vnoremap <C-D> 5j5<C-E>
nnoremap <C-U> 5k5<C-Y>
vnoremap <C-U> 5k5<C-Y>

" NEXT LINE NO MATTER WHAT INSERT MODE (FIXES ISSUE WITH COMMENTS)
inoremap <C-J> <ESC>A<CR><ESC>cc

" QUICKFIX MAPPINGS
nmap <Up> <ESC>:copen<CR>
nmap <Down> <ESC>:cclose<CR>
nmap <Left> <ESC>:cprevious<CR>
nmap <Right> <ESC>:cnext<CR>

" SWITCH BUFFERS
nmap <S-Left> <ESC>:bp<CR>
nmap <S-Right> <ESC>:bn<CR>

" FZF - FILES
map <C-P> <ESC>:Files<CR>

" FZF - BUFFERS
map <LEADER>b <ESC>:Buffers<CR>

" FZF - BUFFER TAG LIST
map <C-B> <ESC>:BTags<CR>

" SAVE SESSION
nmap <silent> <LEADER>ss <ESC>:mks! /tmp/session.vim<CR>
" LOAD SESSION
nmap <silent> <LEADER>sl <ESC>:source /tmp/session.vim<CR>

" COPY RELATIVE & ABSOLUTE PATHS TO SYSTEM CLIPBOARD
nmap <silent> <LEADER>cf :let @+ = expand("%")<CR>
nmap <silent> <LEADER>cF :let @+ = expand("%:p")<CR>

" HORIZONTAL CENTER TO CURSOR POSITION
nnoremap <silent> zm zszH

" SEARCH WITH BACKSLASH
nmap \ :Rg 

" MAKE Y COPY TO THE END
nnoremap Y yg_
