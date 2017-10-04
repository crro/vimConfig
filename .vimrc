let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_winsize=10
let g:netrw_preview=1
let mapleader = ","
set tags=./.git/tags;,tags;
" This opens up the tag finder
nnoremap <leader>. :CtrlPTag<cr>
" Bc I cannot seem to map the alt key this hack lets me do that
" execute "set <M-h>=˙"
" execute "set <M-j>=∆"
" execute "set <M-k>=˚"
" execute "set <M-l>=¬"
nmap <C-h> 5h
nmap <C-j> 5j
nmap <C-k> 5k
nmap <C-l> 5l

syntax on
set number
set backspace=indent,eol,start
" This lets me navigate through the golang errors
nmap <silent> <C-i> <Plug>(ale_previous_wrap)
nmap <silent> <C-o> <Plug>(ale_next_wrap)
" support for gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
" This oppens the tag bar to see what I am working with
nnoremap <silent> <Leader>b :TagbarToggle<CR>
" Run the linter only on save
let g:ale_lint_on_text_changed = 'never'
" Hopeful fix for vim-go
filetype plugin indent on
" Airline configuration

" Enable the tabline
let g:airline#extensions#tabline#enabled = 1

" Configure changing tabs
set hidden
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>

" I had to change dmw to not run autofocus when netrw opens a new window. I
" also change the keybinding that it is using

" This change is to ach things under the cursor
noremap <Leader>a :Ack <cword><cr>
