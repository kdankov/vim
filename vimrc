filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'godlygeek/tabular'
Plugin 'tmhedberg/matchit'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/limelight.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leshill/vim-json'
Plugin 'tpope/vim-markdown'
Plugin 'sjl/vim-sparkup'
Plugin 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'dsawardekar/wordpress.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-haml'
Plugin 'rizzatti/dash.vim'
Plugin 'sjl/gundo.vim'
Plugin 'pasela/ctrlp-cdnjs'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'kana/vim-textobj-user'
Plugin 'jasonlong/vim-textobj-css'
Plugin 'KabbAmine/gulp-vim'
Plugin 'ervandew/supertab'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'scrooloose/syntastic'
Plugin 'StanAngeloff/php.vim'

" Bundle 'captbaritone/better-indent-support-for-php-with-html'
" Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()			" required

filetype plugin indent on

set nocompatible
set t_Co=256

syntax on

" Load plugins that ship with Vim {{{1
runtime macros/matchit.vim
runtime ftplugin/man.vim

colorscheme solarized
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

" Preferences {{{1

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

" Behaviour {{{2
set backspace=indent,eol,start
set history=500
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

set suffixes=.otl

" Appearance {{{2
set ruler
set showcmd
set laststatus=2
set listchars=tab:▸\ ,eol:¬
set number
set cursorline
set hlsearch

set foldlevelstart=99

" Mappings {{{1
"
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

" Moving between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

" Crude visualmode-only mappings for block level XML tags {{{2
nnoremap viT vitVkoj
nnoremap vaT vatV

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

" Macros
let @p = 'yss<p>'
let @a = 'yss<a href="">'
let @l = 'yss<li>'
let @u = 'yss<ul>'
let @o = 'yss<ol>'
let @d = 'yss<div>'

" Javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Add git branch to statusline.
if exists("*fugitive#statusline")
	set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" CtrlP  {{{2
map <leader>gf :CtrlPClearAllCaches<cr>

" Gundo.vim {{{2
map <Leader>u :GundoToggle<CR>

" Space.vim {{{2
let g:space_disable_select_mode=1
let g:space_no_search = 1

" Vim wiki {{{2
let g:vimwiki_menu=''

" Markdown {{{2
let g:markdown_fenced_languages = ['cpp', 'python']

" Ctlr-P {{{2
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

" UltiSnips {{{2
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-snippets/UltiSnips"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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

set secure
