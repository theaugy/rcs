" plugin stuff
call pathogen#infect()
set rtp+=~/g/fzf
Helptags

" trailing whitespace detection:
" create group ExtraWhitespace
highlight ExtraChars ctermbg=red
" autocmd WinNew *.cpp,*.h,*.c,*.hpp,*.ipp :match ExtraChars '\%>80v.\+\|\s\+$'
let g:ctrlp_map = '<c-_>' " temporary until I resolve to eliminate ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|DS_Store)|_updater)$',
  \ 'file': '\v((\.(exe|so|dll))|^moc_)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q" " sets cursor shape for insert mode
let &t_EI.="\e[1 q" " sets cursor shape when we exit insert mode
let &t_te.="\e[0 q"
set statusline=%{winnr()}\ %f\:%l\ /\ %L,\ %c\ %m
" TODO: cleanup!
" sane defaults
set nocompatible hlsearch incsearch showcmd nowrap backspace=2 synmaxcol=300 backupdir=~/.vimswp foldmethod=manual laststatus=2
" preferences
set background=dark shiftwidth=4 tabstop=4 ruler scrolloff=3 linebreak

" this might be a problem for vimdiff
" set shellcmdflag=-lic shell=/bin/bash
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
" possibly problematic for vimdiff
" set shellcmdflag=-lic
let mapleader = "\<Space>"
let maplocalleader = ","
"   nnoremap <Leader>b :AsyncRun /Users/astclair/s/buildvm.sh <Up>
"   nnoremap <Leader>k :AsyncStop<CR>
"   nnoremap <Leader>b :Start! /Users/astclair/s/buildvm_to_file.sh <Up>
"   nnoremap <Leader>r :cfile /tmp/build<CR>
"   nnoremap <Leader>k :Start! ssh buildvm killall make

set makeprg=rscmake
"   nnoremap <Leader>B :set makeprg=/home/astclair/s/buildvm.sh\ <Up>
"   nnoremap <Leader>B :set makeprg=rscmake<Up>
"   nnoremap <Leader>b :Amake!<CR>
"   nnoremap <Leader>r :AmakeStatus<CR>
"   nnoremap <Leader>k :AsyncStop<CR>

" tmux commands
" could be tmux send-keys -t bottom 'rscmake | tee /tmp/lastbuild' Enter | redraw!
" typically tmux send-keys -t bottom Up Enter
" nnoremap <Leader>b :silent exec "!tmux send-keys -t bottom Up Enter" \| redraw!<CR>
" NOTE: This would let you set a breakpoint at the current line in a window
" named 'gdb'
"   nnoremap <Leader>l :silent exec "!tmux send-keys -t gdb 'br ' " . expand('%:t') . ':' .  " line('.') . " Enter" | redraw!
" Commenting these out while I test out kitty
nnoremap <Leader><Space>1 :silent exec "!tmux send-keys -t 1 Up Enter" \| redraw!<CR>
nnoremap <Leader><Space>2 :silent exec "!tmux send-keys -t 2 Up Enter" \| redraw!<CR>
nnoremap <Leader><Space>3 :silent exec "!tmux send-keys -t 3 Up Enter" \| redraw!<CR>
nnoremap <Leader><Space>4 :silent exec "!tmux send-keys -t 4 Up Enter" \| redraw!<CR>
nnoremap <Leader><Space>5 :silent exec "!tmux send-keys -t 5 Up Enter" \| redraw!<CR>
nnoremap <Leader><Space>6 :silent exec "!tmux send-keys -t 6 Up Enter" \| redraw!<CR>
nnoremap <Leader><Space>7 :silent exec "!tmux send-keys -t 7 Up Enter" \| redraw!<CR>
nnoremap <Leader><Space>8 :silent exec "!tmux send-keys -t 8 Up Enter" \| redraw!<CR>
nnoremap <Leader><Space>9 :silent exec "!tmux send-keys -t 9 Up Enter" \| redraw!<CR>

" for kitty
" Turns out kitty uses xterm-kitty so I can't open screen on customer clusters. NOPE.
" nnoremap <Leader>ar :silent exec "!kitty @ send-text --match title:runner '\\x1b[A\\x0a'" \| redraw!<CR>

" search
    "nnoremap <Leader>g :AsyncRun ag <Up>
" search lines
nnoremap <Leader>sl :Ag<CR>
" search files
nnoremap <Leader>sf :Files<CR>

" quickfix
" get errors from last build
nnoremap <Leader>g :cfile /tmp/lastbuild_errors \| silent exec "!tmux kill-session -C" \| redraw! <CR>
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>m :cp<CR>
nnoremap <Leader>, :copen<CR>

" checklists
nnoremap <Leader>ck r<C-k>OK
nnoremap <Leader>cx r<C-k>XX

" misc
" this selects patterns for git merge conflict resolution. mnemonic would be 'diff'
nnoremap <Leader>d /<<<<<<<\\|\|\|\|\|\|\|\|\\|=======\\|>>>>>>><CR>
" write
nnoremap <Leader>w :w<CR>

" complex-repeats/recording
" this re-runs whatever is in q immediately.
nnoremap <Leader>q @q
" these are a handful of repeats that should be enough when doing a set of
" repetive actions
nnoremap <Leader>ra @a
nnoremap <Leader>rs @s
nnoremap <Leader>rj @j
nnoremap <Leader>rk @k
nnoremap <Leader>rl @l

" window navigation
nnoremap <Leader>1 <C-w>1w<C-w>_
nnoremap <Leader>2 <C-w>2w<C-w>_
nnoremap <Leader>3 <C-w>3w<C-w>_
nnoremap <Leader>4 <C-w>4w<C-w>_
nnoremap <Leader>5 <C-w>5w<C-w>_
nnoremap <Leader>6 <C-w>6w<C-w>_
nnoremap <Leader>7 <C-w>7w<C-w>_
nnoremap <Leader>8 <C-w>8w<C-w>_

nnoremap <Tab> za
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
autocmd Filetype markdown setl foldexpr=NestedMarkdownFolds()
set laststatus=2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown conceallevel=2 foldexpr=NestedMarkdownFolds()

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'cpp' ]
" set conceallevel=2
let g:vim_markdown_new_list_item_indent = 4

set matchpairs+=<:>

"map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
autocmd Filetype cpp nmap <buffer> <C-K> <c-o>:pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
autocmd Filetype cpp nmap <buffer> <C-K> :pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
autocmd Filetype cpp vmap <buffer> <C-K> :pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
set cinoptions=:0L0g0
set relativenumber
set nocursorline
set iskeyword=@,48-57,_,192-255

" from https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0 " oh yes it does
endif

let g:vim_markdown_new_list_item_indent = 2
set conceallevel=2

let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" let g:solarized_termcolors = 16
"colorscheme solarized

" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=minimal")'
endif

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>,
            \ fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

" this doesn't work and it drives me a little nuts.
command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --nogroup --nocolor '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" but this does. I had to add --nocolor directly into fzf.vim
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 fzf#vim#with_preview('right:50%'),
  \                 <bang>0)

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000
