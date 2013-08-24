set nocompatible
set t_Co=256
colorscheme torte
set bg=dark
let mapleader = ","
noremap \ ,

" Load plugins that ship with Vim {{{1
runtime macros/matchit.vim
runtime ftplugin/man.vim

" Load bundled plugins {{{1
execute pathogen#infect()

" Autocommands {{{1
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif

" Preferences {{{1
" Behaviour {{{2
set backspace=indent,eol,start
set history=50
set incsearch
set visualbell t_vb=
set hidden
set nojoinspaces
set nrformats=
if has('mouse')
  " Don't want the mouse to work in insert mode.
  set mouse=nv
endif

" Tab-completion in command-line mode
set wildmode=full
set wildmenu
set wildignore=*.pdf,*.fo,*.xml
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/* " Ignore rules for Vim and plug-ins.
set suffixes=.otl

" Appearance {{{2
set ruler
set showcmd
set laststatus=2
set listchars=tab:▸\ ,eol:¬
set number
set cursorline
" When the terminal has colors, enable syntax+search highlighting
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
set foldlevelstart=99

" Indentation {{{2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set nowrap

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

" Mappings {{{1
" Quick toggles {{{2

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Toggle hidden characters
nmap <silent> <leader>l :set list!<CR>

" Toggle search highlight
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Commands to quickly set >1 option in one go {{{2
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Maxsize set columns=1000 lines=1000

" Window switching {{{2
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" File opening {{{2
" Shortcuts for opening file in same directory as current file
cnoremap <expr> %%  getcmdtype() == ':' ? escape(expand('%:h'), ' \').'/' : '%%'

map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Prompt to open file with same name, different extension
map <leader>er :e <C-R>=expand("%:r")."."<CR>

" Moving in Text mode
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" Moving between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Open URLs
nmap <silent> <leader>U :Open<CR>

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
map [F $
imap [F $
map [H g0
imap [H g0

" Easier horizontal scrolling
map zl zL
map zh zH

" Fix the & command in normal+visual modes {{{2
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>

" Filetype specific config
if has("autocmd")
	autocmd Filetype markdown setlocal wrap
	autocmd Filetype markdown setlocal linebreak
	autocmd Filetype markdown setlocal nolist
endif

" Crude visualmode-only mappings for block level XML tags {{{2
nnoremap viT vitVkoj
nnoremap vaT vatV

" Toggle betwen absolute and relative numbers
function! g:ToggleNuMode()
	if(&rnu == 1)
		set nu
	else
		set rnu
	endif
endfunction
nnoremap <C-L> :call g:ToggleNuMode()<cr> 

" Strip trailing whitespace {{{2
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" Escape and paste a register {{{2
" <c-x>{char} - paste register into search field, escaping sensitive chars
" http://stackoverflow.com/questions/7400743/
cnoremap <c-x> <c-r>=<SID>PasteEscaped()<cr>
function! s:PasteEscaped()
  echo "\\".getcmdline()."\""
  let char = getchar()
  if char == "\<esc>"
    return ''
  else
    let register_content = getreg(nr2char(char))
    let escaped_register = escape(register_content, '\'.getcmdtype())
    return substitute(escaped_register, '\n', '\\n', 'g')
  endif
endfunction

" Custom commands {{{1
function! Foo()
  call system('sleep 2')
endfunction

" :Stab {{{2
" Set tabstop, softtabstop and shiftwidth to the same value
" From http://vimcasts.org/episodes/tabs-and-spaces/
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    end
  finally
    echohl None
  endtry
endfunction

" :CloseHiddenBuffers {{{2
" Wipe all buffers which are not active (i.e. not visible in a window/tab)
" Using elements from each of these:
"   http://stackoverflow.com/questions/2974192
"   http://stackoverflow.com/questions/1534835
command! -nargs=* Only call CloseHiddenBuffers()
function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      let l:tally += 1
      exe 'bw ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun

" Plugin configuration {{{1

" Javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" textobj-entire {{{2
" textobj-entire defines: ie/ae maps
" Instead, use:           ia/aa
let g:textobj_entire_no_default_key_mappings = 1
xmap aa  <Plug>(textobj-entire-a)
omap aa  <Plug>(textobj-entire-a)
xmap ia  <Plug>(textobj-entire-i)
omap ia  <Plug>(textobj-entire-i)
" netrw.vim {{{2
let g:netrw_banner=0
" Fugitive.vim {{{2
if has("autocmd")

  " Auto-close fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " Navigate up one level from fugitive trees and blobs
  autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

endif

" Add git branch to statusline.
if exists("*fugitive#statusline")
  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" Gundo.vim {{{2
map <Leader>u :GundoToggle<CR>

" Space.vim {{{2
let g:space_disable_select_mode=1
let g:space_no_search = 1

" Vim-ruby {{{2
let ruby_fold=1

" Vim wiki {{{2
let g:vimwiki_menu=''

" Markdown {{{2
let g:markdown_fenced_languages = ['cpp', 'python']

" Ctlr-P {{{2
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0

" Pipe a URL to the default browser {{{1
"
" Public:
"
command! -count=0 -nargs=* -complete=file Open call s:Open(<count>, <f-args>)

function! Open(path)
  call s:Open(0, a:path)
endfunction

"
" Private:
"
function! s:Open(count, ...)
  if a:count > 0
    " then the path is visually selected
    let path = s:GetMotion('gv')
  elseif a:0 == 0
    " then the path is the filename under the cursor
    let path = expand('<cfile>')
  else
    " it has been given as an argument
    let path = join(a:000, ' ')
  endif

  call s:OpenUrl(path)
  echomsg 'Opening '.path
endfunction

" Open URLs with the system's default application. Works for both local and
" remote paths.
function! s:OpenUrl(url)
  let url = shellescape(a:url)

  if has('mac')
    silent call system('open '.url)
  elseif has('unix')
    if executable('xdg-open')
      silent call system('xdg-open '.url.' 2>&1 > /dev/null &')
    else
      echoerr 'You need to install xdg-open to be able to open urls'
      return
    end
  else
    echoerr 'Don''t know how to open a URL on this system'
    return
  end
endfunction

" Execute the normal mode motion "motion" and return the text it marks. Note
" that the motion needs to include a visual mode key, like "V", "v" or "gv".
function! s:GetMotion(motion)
  let saved_cursor   = getpos('.')
  let saved_reg      = getreg('z')
  let saved_reg_type = getregtype('z')

  exec 'normal! '.a:motion.'"zy'
  let text = @z

  call setreg('z', saved_reg, saved_reg_type)
  call setpos('.', saved_cursor)

  return text
endfunction

