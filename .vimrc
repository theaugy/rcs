" plugin stuff
call pathogen#infect()
set rtp+=~/g/fzf
let g:fzf_history_dir = '~/.fzf_history'
Helptags
let g:ctrlp_map = '<c-l>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|DS_Store)|_updater)$',
  \ 'file': '\v((\.(exe|so|dll))|^moc_)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q" " sets cursor shape for insert mode
let &t_EI.="\e[1 q" " sets cursor shape when we exit insert mode
let &t_te.="\e[0 q"
set statusline=%{winnr()}\ %f\ -\ %l\ /\ %L,\ %c\ %m
" TODO: cleanup!
" sane defaults
set nocompatible hlsearch incsearch showcmd nowrap backspace=2 synmaxcol=300 backupdir=~/.vimswp foldmethod=manual laststatus=2
" preferences
set background=dark shiftwidth=4 tabstop=4 ruler scrolloff=3 shellcmdflag=-lic shell=/bin/bash relativenumber
" writing prose
set linebreak
" coding related
set cindent expandtab
syntax on

map <F5> 1<C-W>_
map <F6> 10<C-W>_
map <F7> <C-W>_
map <F9> 100<C-W>>
map <F8> 100<C-W><
" sign a comment with F2
nmap <F2> :r!date +//\ -\ SAS\ \%B\ \%d\ \%Y<C-M>==
filetype plugin on
filetype indent on

" use up to 20 lines to show ctrlp results, and let the list get up to 50
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
set shellcmdflag=-lic
let mapleader = "\<Space>"
nnoremap <Leader>b :AsyncRun <Up>
nnoremap <Leader>k :AsyncStop<CR>
nnoremap <Leader>g :AsyncRun! ag <Up>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>m :cp<CR>
nnoremap <Leader>, :copen<CR>
" nnoremap <Leader>s :%s<Up>
nnoremap <Leader>ss :BLines<CR>
nnoremap <Leader>sp :Ag<CR>
nnoremap <Leader>q @q
nnoremap <Leader>1 <C-w>1w<C-w>_
nnoremap <Leader>2 <C-w>2w<C-w>_
nnoremap <Leader>3 <C-w>3w<C-w>_
nnoremap <Leader>4 <C-w>4w<C-w>_
nnoremap <Leader>5 <C-w>5w<C-w>_
nnoremap <Leader>6 <C-w>6w<C-w>_
nnoremap <Leader>7 <C-w>7w<C-w>_
nnoremap <Leader>8 <C-w>8w<C-w>_
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 
set laststatus=2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown conceallevel=2 foldexpr=NestedMarkdownFolds()

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'cpp' ]
" set conceallevel=2
let g:vim_markdown_new_list_item_indent = 4

set matchpairs+=<:>

set cinoptions=:0L0g0
set norelativenumber
set cursorline
set iskeyword=@,48-57,_,192-255
