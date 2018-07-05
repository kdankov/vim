" For a paranoia.
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

if exists('*minpac#init')
  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('vim-jp/syntax-vim-ex')

  call minpac#add('w0rp/ale')

  call minpac#add('rizzatti/funcoo.vim')
  call minpac#add('tomtom/tlib_vim')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-ragtag')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('stephpy/vim-yaml')
  call minpac#add('nelstrom/vim-visual-star-search')
  call minpac#add('AndrewRadev/splitjoin.vim')
  call minpac#add('AndrewRadev/sideways.vim')
  call minpac#add('godlygeek/tabular')
  call minpac#add('tmhedberg/matchit')
  call minpac#add('altercation/vim-colors-solarized')
  call minpac#add('junegunn/limelight.vim')
  call minpac#add('kien/ctrlp.vim')
  call minpac#add('mileszs/ack.vim')
  call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('cakebaker/scss-syntax.vim')
  call minpac#add('othree/html5.vim')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('leshill/vim-json')
  call minpac#add('tpope/vim-markdown')
  call minpac#add('sjl/vim-sparkup')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('SirVer/ultisnips')
  call minpac#add('kdankov/vim-snippets')
  call minpac#add('dsawardekar/wordpress.vim')
  call minpac#add('junegunn/goyo.vim')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('tpope/vim-haml')
  call minpac#add('rizzatti/dash.vim')
  call minpac#add('sjl/gundo.vim')
  call minpac#add('pasela/ctrlp-cdnjs')
  call minpac#add('2072/PHP-Indenting-for-VIm')
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('jasonlong/vim-textobj-css')
  call minpac#add('KabbAmine/gulp-vim')
  call minpac#add('ervandew/supertab')
  call minpac#add('shawncplus/phpcomplete.vim')
  "call minpac#add('scrooloose/syntastic')
  call minpac#add('StanAngeloff/php.vim')
  call minpac#add('captbaritone/better-indent-support-for-php-with-html')
  call minpac#add('scrooloose/nerdtree')

  " Learning vim the HARD way
  call minpac#add('wikitopian/hardmode')

endif

" Default settings here.

filetype plugin indent on

set t_Co=256

syntax on

if filereadable( expand("$HOME/.vim/pack/minpac/start/vim-colors-solarized/colors/solarized.vim") )
	colorscheme solarized
endif

set bg=dark

let mapleader = ","
noremap \ ,
set exrc

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set nowrap

set rnu

set undofile
set undodir=~/.vim/tmp/undo
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

set nobackup
set noswapfile

set backspace=indent,eol,start
set history=1000
set incsearch
set visualbell t_vb=
set hidden
set nojoinspaces
set nrformats=

" Tab-completion in command-line mode
set wildmode=full
set wildmenu
set wildignore=*.pdf,*.fo,*.xml
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/* " Ignore rules for Vim and plug-ins.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/* " Linux/MacOSX

" Appearance
set ruler
set showcmd
set laststatus=2
set listchars=tab:▸\ ,eol:¬
set number
set norelativenumber
set cursorline
set hlsearch

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

" Moving between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Open URLs
nmap <silent> <leader>U :Open<CR>

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
map [F $
imap [F $
map [H g0
imap [H g0

" Easier horizontal scrolling
map zl zL
map zh zH

" Fix the & command in normal+visual modes {{{2
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>

" Crude visualmode-only mappings for block level XML tags {{{2
nnoremap viT vitVkoj
nnoremap vaT vatV

" Macros
let @p = 'yss<p>'
let @a = 'yss<a href="#">'
let @l = 'yss<li>'
let @u = 'yss<ul>'
let @o = 'yss<ol>'
let @d = 'yss<div>'
let @n = 'vip:norm@avip:norm@lvipS<ul>'

" Plugin settings here.

" HardMode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" CtrlP
map <leader>gf :CtrlPClearAllCaches<cr>

let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0

let g:ctrlp_prompt_mappings = {
		\ 'AcceptSelection("e")': ['<c-t>'],
		\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
		\ }

let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(git|hg|svn)$',
		\ 'node':  '\v[\/]\(node_modules)$',
		\ 'bower':  '\v[\/]\(bower_components)$',
		\ 'file': '\v\.(exe|so|dll|map)$',
		\ }

" Gundo
map <Leader>u :GundoToggle<CR>

" Space.vim
let g:space_disable_select_mode=1
let g:space_no_search = 1

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Snippets dir
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/pack/minpac/start/vim-snippets/UltiSnips']

" Assigning snippets to filetypes
autocmd FileType scss UltiSnipsAddFiletypes css

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

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
