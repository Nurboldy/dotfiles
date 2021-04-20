set ttyfast
set lazyredraw
set timeout
set timeoutlen=1000
set ttimeoutlen=50
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set history=1000
set viminfo='1000,f1,<500,:100,/100,h,n~/.vim/viminfo
set nocursorcolumn
set nocursorline
set cmdheight=2
set hidden
filetype plugin on

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode




let mapleader = ","
map q <Nop>
nnoremap <C-Z> u
nnoremap <C-Y> <C-R>


call plug#begin('~/.vim/plugged')
"coc AutoCompletion LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Vim go GOLANG
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
call plug#end()

"Vim-go mappings
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
au FileType go nnoremap <leader>gl :GoLint<CR>
au FileType go nnoremap <leader>gv :GoVet<CR>
au FileType go nnoremap <leader>ge :GoErrCheck<CR>


" GoTo code navigation. COC
nnoremap <leader>gd <Plug>(coc-definition)
nnoremap <leader>gy <Plug>(coc-type-definition)
nnoremap <leader>gi <Plug>(coc-implementation)
nnoremap <leader>gr <Plug>(coc-references)

"fzf
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :Lines<CR>
let g:fzf_layout = { 'down': '40%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


"simple stuff
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
inoremap jj <Esc>
map q <Nop>
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :bprevious<CR>

"Quick take note
nnoremap <leader>t :e $HOME/Project/notes/todo.md <CR>


map <Down> <Nop>
map <Up> <Nop>
map <Left> <Nop>
map <Right> <Nop>


"Netrw tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1

let g:netrw_fastbrowse = 0

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

nnoremap <leader> e :call ToggleNetrw()<CR>

syntax on
colo seoul256
