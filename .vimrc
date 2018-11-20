let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_winsize=10
let g:netrw_preview=1
let mapleader = ","
" This turns on incremental search
set incsearch
" This turns on autoload
set autoread
" We are setting the scrolloff property for the cursor
if !&scrolloff
	set scrolloff=1
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
set tags=./.git/tags;,tags;
" This opens up the tag finder
nnoremap <leader>. :Tags
" Bc I cannot seem to map the alt key this hack lets me do that
" execute "set <M-h>=˙"
" execute "set <M-j>=∆"
" execute "set <M-k>=˚"
" execute "set <M-l>=¬"
" nmap <C-h> 5h
nmap <C-j> 5j
nmap <C-k> 5k
" nmap <C-l> 5l

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
nnoremap <C-h> :bnext<CR>
nnoremap <C-l> :bprev<CR>

" I had to change dmw to not run autofocus when netrw opens a new window. I
" also change the keybinding that it is using

" This change is to ach things under the cursor
noremap <Leader>a :Ack <cword><cr>
" Set up color scheme
colorscheme afterglow
" Make Ack use ripgrep
" let g:ackprg = 'rg --vimgrep --no-heading'
let g:ackprg = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden -g "!tags*" --follow --glob "!.git/*"'
" BuffKill vim kills the buffer without closing the window using :BD
" Installing fzf
set rtp+=~/.fzf
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" This command also ignores the tag file so that it doesn't search it
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden -g "!tags*" --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Adding a shortcut for finiding files
nnoremap <C-p> :Files<CR>
" Adding a shortcut for finind terms
nnoremap <C-f> :Find 
" Use fd for ctrlp.
if executable('fd')
    let g:ctrlp_user_command = 'fd -c never "" "%s"'
    let g:ctrlp_use_caching = 0
endif
" Now we are going to use NERDTree and toggle it
map <C-e> :NERDTreeToggle<CR>
