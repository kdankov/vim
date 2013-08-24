set bg=dark
set guifont=Monaco:h14

silent! colorscheme solarized
let g:solarized_menu=0
silent! colorscheme solarized
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
