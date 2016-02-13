set bg=dark
set macligatures
set guifont=Fira\ Code:h14
" https://github.com/tonsky/FiraCode

silent! colorscheme solarized
let g:solarized_menu=0

if exists('*togglebg#map')
  call togglebg#map("<F5>")
endif

if exists('*HexHighlight()')
  " http://www.vim.org/scripts/script.php?script_id=2937
  nmap <leader>h :call HexHighlight()<Return>
endif

" Do not use modal alert dialogs! (Prefer Vim style prompt.)
" http://stackoverflow.com/questions/4193654/using-vim-warning-style-in-gvim
set guioptions+=c

" Do not use Aqua scrollbars
set guioptions-=rL

" Enable persistent undo {{{2
set undofile
set undodir=~/tmp/vim/undo
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

" Disable swapfile and backup {{{2
set nobackup
set noswapfile
" }}}
