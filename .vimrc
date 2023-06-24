"---------------------------------------------------------------------------
" Config Vim
"---------------------------------------------------------------------------
set autoread
set autowrite
set complete -=i
set complete -=t
set completeopt =menuone
set encoding=UTF-8
set foldmethod =marker
set guifont=Consolas:h11
set laststatus =2
set linebreak
set mouse =niv
set noswapfile
set nowrap
set number
set numberwidth =6
set readonly!
set scrolloff =3
set shiftwidth =3
set smarttab
set t_Co =256
set tabstop =3
colorscheme desert

if ($USER == "tientq")
	set viminfo+=n/coasiasemi/project/dv/tientq/.viminfo
endif

"set incsearch
"set autochdir
"set whichwrap =<,>,h,l

"---------------------------------------------------------------------------
" Tags ( to goto define) ( to back)
"---------------------------------------------------------------------------
set tags +=tags
set tags +=../tags
set tags +=../../tags
set tags +=../../../tags
set tags +=../../../../tags
set tags +=../../../../../tags

"---------------------------------------------------------------------------
" Auto command
"---------------------------------------------------------------------------
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * if argc()  | NERDTree | wincmd p | endif

autocmd InsertEnter * set nocul | set timeoutlen=0
autocmd InsertLeave * set cul   | set timeoutlen=1000 | w!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"---------------------------------------------------------------------------
" Vim Plug
"---------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
	Plug     'https://github.com/kien/ctrlp.vim.git '
	Plug 		'https://github.com/vhda/verilog_systemverilog.vim'
	Plug 		'https://github.com/preservim/nerdtree'
	Plug 		'https://github.com/godlygeek/tabular'
	Plug 		'https://github.com/andymass/vim-matchup'
"	Plug 		'https://github.com/vim-syntastic/syntastic'
	Plug 		'https://github.com/preservim/tagbar'
	Plug     'https://github.com/easymotion/vim-easymotion'

call plug#end()

"---------------------------------------------------------------------------
" Dictionary
"---------------------------------------------------------------------------
set dictionary=~\dictionary
set dictionary+=~\snipet.vim
set complete +=k

"---------------------------------------------------------------------------
" Save file (Normal, Insert and Visual modes)
"---------------------------------------------------------------------------
let g:swap=0

nnoremap <F1> <esc>:q!<cr>
inoremap <F1> <esc>
vnoremap <F1> <esc>:q!<cr>

inoremap <expr> ( ((getline('.')[col('.')-8 : col('.')-2]) == 'display') ? "();\<left>\<left>" :
                \ ((getline('.')[col('.')-4 : col('.')-2]) == 'new'    ) ? "();\<left>\<left>" :
                \ ((getline('.')[col('.')-7 : col('.')-2]) == 'create' ) ? "();\<left>\<left>" :
					 \ ((getline('.')[col('.')]) 						=~ '\K') 	 ? "("                 :
					 \ ((getline('.')[col('.')]) 						=~ '\d') 	 ? "("                 :
					 \ "()\<left>"
inoremap <expr> {   ((getline('.')[col('.')]) =~ '\K') ? "{" :
						\ ((getline('.')[col('.')]) =~ '\d') ? "{" :
						\ "{}<left>"
inoremap <expr> [   ((getline('.')[col('.')]) =~ '\K') ? "[" :
						\ ((getline('.')[col('.')]) =~ '\d') ? "[" :
						\ "[]\<left>"

inoremap <expr> "   ((getline('.')[col('.')-1]) == '"') ? "\"<del>" :
			\((getline('.')[col('.')-1]) =~ '[a-zA-Z0-9_]') ? "\"" :
			\ "\"\"\<left>"

inoremap <expr> ) ((getline('.')[ col('.') - 1 ]) == ')') ? ")\<del>" : ")"
inoremap <expr> } ((getline('.')[ col('.') - 1 ]) == '}') ? "}\<del>" : "}"
inoremap <expr> ] ((getline('.')[ col('.') - 1 ]) == ']') ? "]\<del>" : "]"

inoremap <expr> <up>   (pumvisible()) ? "<c-p>" : "<up>"
inoremap <expr> <down> (pumvisible()) ? "<c-n>" : "<down>"

nnoremap <c-g> 1<c-g>

"---------------------------------------------------------------------------
" Set wrap
"---------------------------------------------------------------------------
let g:swap=0
nnoremap <expr> sw (g:swap == 1) ? ":let g:swap=0<cr>:set wrap<cr>" 
			\: ":let g:swap=1<cr>:set nowrap<cr>"

"---------------------------------------------------------------------------
" My defined
"---------------------------------------------------------------------------
nmap <c-a> ggVG
imap <c-a> ggVG
vmap <c-a> ggVG

nnoremap - Gzz
nnoremap s <esc>

nnoremap c <esc>cw

"nnoremap      <F5> <esc>:e!<cr>:SyntasticCheck<cr>:echo "Successfully reload file!"<cr>
nnoremap      <F5> <esc>:e!<cr>:echo "Successfully reload file!"<cr>

nnoremap > v>
nnoremap < v<
nnoremap = v=

nnoremap <c-h> :%s///g<left><left><left>
vnoremap <c-h> :s///g<left><left><left>

nnoremap n nzz

nnoremap <space> 10jzz
vnoremap <space> 10jzz

vnoremap <tab> <esc><c-w>w

nnoremap <c-right>	z5l
nnoremap <c-left>		z5h
nnoremap <c-down>		5jzz
nnoremap <c-up>		5kzz

nnoremap J 10j
nnoremap K 10k
vnoremap J 10jzz
vnoremap K 10kzz

nnoremap * evby<esc>:%s/\<<C-R>=escape(@",'/\')<cr>\>//gn<cr>0n
nnoremap / :%s///gn<left><left><left><left>
nnoremap <c-f> :%s///gn<left><left><left><left>

nnoremap vi  <esc>:vi
nnoremap :Vi <esc>:vi
nnoremap g/  <esc>:g/
nnoremap sm  <esc>:set modifiable<cr>

nnoremap <c-w>v <c-w>v<c-w>w

nnoremap tn :tabnew<cr>:E<cr>

nnoremap :E<cr> :Explore<cr><c-w>w<c-w>W

nnoremap <c-@> <esc>A
inoremap <c-@> <esc>A

nnoremap <c-space> <esc>A
inoremap <c-space> <esc>A

"---------------------------------------------------------------------------
" Fold
"---------------------------------------------------------------------------
highlight Folded ctermbg=242 ctermfg=234
nnoremap zf :call Fold()<cr>

function! Fold()
	let cur_line = getline('.')
	if ((cur_line =~ '.*begin') || (cur_line =~ '.*function.*') || (cur_line =~ '.*task.*')
				\ || (cur_line =~ '.*ifdef.*') || (cur_line =~ '.*case.*'))
				\ || (cur_line =~ '.*module.*') || (cur_line =~ '.*class.*')
				\ || (cur_line =~ '{') || (cur_line =~ '}')
				\ && (cur_line !~ '.*\*{{{\*') && (cur_line !~ '.*\*}}}\*')
		call feedkeys("zf", 'n')
		call feedkeys("%", 'm')
	else
		call feedkeys("za", 'n')
	endif
endfunction

"---------------------------------------------------------------------------
" Remember cursor position
"---------------------------------------------------------------------------
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif


"---------------------------------------------------------------------------
" comment by ctrl + /
"---------------------------------------------------------------------------
function! Comment()

	let filetype = &filetype
	let pair = getline('.')[col(0)]
	let cur_line = getline('.')
	if (filetype=='verilog_systemverilog' || filetype=='c' || filetype=='fortran' || filetype=='systemC')
		if cur_line =~ "//"
			silent s:\s*// ::g
		elseif pair == '/'
			silent s:^\//::g
		else
			silent s:^:\//\ :g
		endif
	elseif (filetype == 'vim')
		if pair == '"'
			silent s:^\"::g
		else
			silent s:^:\":g
		endif
	else
		if pair == '#'
			silent s:^#::g
		else
			silent s:^:#:g
		endif
	endif
endfunction

vnoremap <c-_> :call Comment()<cr>
nnoremap <c-_> :call Comment()<cr>
inoremap <c-_> <esc>:call Comment()$a<cr>
nnoremap ? :call Comment()<cr>
vnoremap ? :call Comment()<cr>

"---------------------------------------------------------------------------
" NERDTree
"---------------------------------------------------------------------------
let g:NERDTreeStatusline = '=>%#NonText#'
let g:NERDTreeWinSize = 27
"let g:NERDTreeShowBookmarks = 1

function! NERDTree()
	if g:stt_tree == 1
		silent :NERDTree
		let g:stt_tree = 0
	else
		silent :NERDTreeClose
		let g:stt_tree = 1
	endif
endfunction

nnoremap <F3> :NERDTreeToggle<cr>:echo "Run NERDTree!"<cr>
"let g:stt_tree = 0
"nnoremap <F3> :call NERDTree()<cr>:echo "Run NERDTree!"<cr>

"---------------------------------------------------------------------------
" Tagbar
"---------------------------------------------------------------------------
nnoremap <F4> :NERDTreeToggle<cr>:TagbarToggle<cr>:echo "Run TagBar!"<cr><c-w>w

"---------------------------------------------------------------------------
" Delete Bracket
"---------------------------------------------------------------------------
inoremap <expr> <bs> <sid>remove_pair()
imap <c-h> <bs>

function s:remove_pair() abort
	let pair_before = getline('.')[ col('.')-2 ]
	let pair_after = getline('.')[ col('.')-1 ]

	if ((pair_before == '(') && (pair_after == ')'))
				\ || ( (pair_before == '{') && (pair_after == '}') )
				\ || ( (pair_before == '[') && (pair_after == ']') )
				\ || ( (pair_before == '"') && (pair_after == '"') )
		return "\<del>\<c-h>"
	elseif getline('.')[ col('.')-3 ] =~ '\W'
		return "\<c-h>\<esc>a"
	elseif pumvisible()
		return "\<left>\<right>\<bs>\<c-n>\<c-p>"
	else
		return "\<c-h>"
endfunction

"---------------------------------------------------------------------------
" Tabular
"---------------------------------------------------------------------------
vnoremap _ 	y:Tabularize /<C-R>=escape(@",'/\')<cr><cr>
nnoremap _ 	vy:Tabularize /<C-R>=escape(@",'/\')<cr><cr>
vnoremap ta :Tabularize /

highlight DiffAdd ctermfg=176 ctermbg=none cterm=underline
highlight DiffChange ctermfg=176 ctermbg=none cterm=underline
highlight DiffDelete ctermfg=blue ctermbg=none
highlight DiffText ctermfg=215 ctermbg=none

"---------------------------------------------------------------------------
" Highlight Status Line
"---------------------------------------------------------------------------
set statusline ==>
set statusline +=%1*\____\ "File name
set statusline +=%2*\%<%t\ "File name
set statusline +=%3*\____\ "File name
set statusline +=%8*\ %=\ row:%l/%L "Row
set statusline +=%9*\ col:%2c\ "Colnr

highlight StatusLine ctermfg=241 ctermbg=lightred
highlight VertSplit ctermbg=black ctermfg=240
highlight StatusLineNC ctermbg=240 ctermfg=240

"---------------------------------------------------------------------------
" HighlightPopup complete
"---------------------------------------------------------------------------
set pumheight =8
highlight Pmenu ctermfg=DarkGray ctermbg=233
highlight PmenuSel ctermfg=blue ctermbg=233
highlight Search ctermfg=black cterm=underline ctermbg=185
highlight PmenuThumb ctermfg=245 ctermbg=245
highlight PmenuSbar ctermfg=240 ctermbg=240
	" Pmenu      – normal item
	" PmenuSel   – selected item
	" PmenuSbar  – scrollbar
	" PmenuThumb – thumb of the scrollbar

"---------------------------------------------------------------------------
" Highlight Cursorline
"---------------------------------------------------------------------------
set cursorline
highlight CursorLine cterm=none ctermbg=237
highlight CursorLineNr ctermfg=blue ctermbg=none guifg=Brown
highlight LineNr ctermfg=245 ctermbg=none guifg=Grey
highlight Visual cterm=underline ctermfg=none ctermbg=238
highlight Cursor ctermfg=white ctermbg=white


"---------------------------------------------------------------------------
" Highlight NERDTree
"---------------------------------------------------------------------------
highlight NERDTreeOpenable        ctermfg=250                  guifg=gray
highlight NERDTreeClosable        ctermfg=250                  guifg=gray
highlight NERDTreeDir             ctermfg=blue                 guifg=blue 
highlight NERDTreeDirSlash        ctermfg=248                  guifg=gray 
highlight NERDTreeHelpKey         ctermfg=248                  guifg=gray
highlight NERDTreeFile            ctermfg=248                  guifg=gray
highlight NERDTreeLinkTarget      ctermfg=blue cterm=underline guifg=gray
highlight NERDTreeLinkDir         ctermfg=13                   guifg=gray
highlight NERDTreeLinkFile        ctermfg=139                  guifg=gray
highlight NERDTreeExecFile        ctermfg=248                  guifg=gray
highlight NERDTreeCWD             ctermfg=176                  guifg=gray
highlight NERDTreeup              ctermfg=248                  guifg=gray
highlight NERDTreeHelp            ctermfg=248                  guifg=gray
highlight NERDTreeBookmark        ctermfg=gray                 guifg=gray
highlight NERDTreeBookmarksLeader ctermfg=233                  guifg=gray
highlight NERDTreeBookmarksHeader ctermfg=gray                 guifg=gray
highlight NERDTreeBookmarkName    ctermfg=215                  guifg=gray

"---------------------------------------------------------------------------
" Highlight bracket
"---------------------------------------------------------------------------
highlight MatchParen cterm=none ctermbg=brown ctermfg=white

"---------------------------------------------------------------------------
" Highlight Error Status
"---------------------------------------------------------------------------
highlight ErrorMsg ctermfg=001 ctermbg=white cterm=reverse "underline

"-------------------------------------------
" Auto complete
"-------------------------------------------
"set completeopt+=longest

set shortmess +=c "Not show mess complete
inoremap <c-1> <c-n><c-p>
autocmd InsertCharPre * call AutoComplete()

function! AutoComplete()
	if v:char =~ '\K'
				\ && getline('.')[col('.') - 5] !~ '\K'
				\ && getline('.')[col('.') - 4] =~ '\K'
				\ && getline('.')[col('.') - 3] =~ '\K'
				\ && getline('.')[col('.') - 2] =~ '\K'
				\ && getline('.')[col('.') - 1] !~ '\K' " last char

		call feedkeys("\<c-1>",'m')
	endif
endfunction

"---------------------------------------------------------------------------
"  vim-easymotion
"---------------------------------------------------------------------------
nmap f          <Plug>(easymotion-bd-w)
nmap <c-j> 		 <Plug>(easymotion-j)
nmap <c-k> 		 <Plug>(easymotion-k)

highlight EasyMotionTarget ctermbg=none ctermfg=lightblue
highlight EasyMotionTarget2First ctermbg=none ctermfg=248
highlight EasyMotionTarget2Second ctermbg=none ctermfg=248

"---------------------------------------------------------------------------
" Enter for snipet
"---------------------------------------------------------------------------
imap <c-2> <space><esc>/_fill<cr><left><right><esc>
imap <expr> <nowait> <cr> <sid>snipet()
inoremap <nowait> <c-3> <cr>

function s:snipet() abort
	let _Ent = getline('.')[ col('.')-5 : col('.')-2 ]
	let _begin = getline('.')[ col('.')-6 : col('.')-2 ]
	let cur_line = getline('.')

	let cursor = getline('.')[col('.')-1]
	let cursor_before = getline('.')[ col('.')-2 ]

	if (_Ent=='_Ent')
		return "\<space>\<left>"
	elseif (cursor_before=='(' && cursor==')')
		return "\<c-3>\<esc>A;\<esc>O"
	elseif ( (cursor_before=='{' && cursor=='}') )
		return "\<c-3>\<esc>O"
	elseif (_begin=='begin')
		return "\<space>\<bs>\<c-3>end\<esc>O"
	elseif (cur_line =~ '\s*class .*;')
		return "\<c-3>end cla ss\<esc>hhxhhhhx=O"
	elseif (cur_line =~ '\s*module .*;')
		return "\<c-3>end mod ule\<esc>hhhxhhhhxhhhhxO"
	elseif (cur_line =~ '\s*task .*;')
		return "\<c-3>end tas k\<esc>hxhhhhx=O"
	elseif (cur_line =~ '\s*function .*;')
		return "\<esc>0ffwwvey$a\<c-3>// \<esc>p0aend fun cti on\<esc>hhxhhhhxhhhhx=\<esc>O"
	elseif (cur_line =~ '\s*case.*)')
		return "\<c-3>end cas e\<esc>hxhhhhx=O"
	elseif ((cur_line =~ '`ifdef') || (cur_line =~ '`ifndef'))
		return "\<esc>$bveyA\<c-3>`end if\<esc>A //\<esc>=$p0f xO"
	elseif (pumvisible())
		return "\<space>\<bs>"
	else
		return "\<c-3>"
	endif
endfunction

"---------------------------------------------------------------------------
" Super Tab by tian
"---------------------------------------------------------------------------
imap <expr> <tab> <sid>Supertab()
inoremap <F10> <tab>

function s:Supertab() abort
	if getline('.')[col('.') - 2] !~ '\K'
				\ && getline('.')[col('.') - 2] !~ '\d'
		return "\<F10>"
	elseif (pumvisible())
		return "\<c-n>"
	else
		return "\<c-n>\<c-p>"
	endif
endfunction

"---------------------------------------------------------------------------
" Jump among windows
"---------------------------------------------------------------------------
nnoremap <tab> <c-w>w

"---------------------------------------------------------------------------
" Search in visual mode
"---------------------------------------------------------------------------
vnoremap * y/\V<C-R>=escape(@",'/\')<cr><cr>

"---------------------------------------------------------------------------
" Auto detect filetype
"---------------------------------------------------------------------------
au BufRead,BufNewFile *.jj2 		set ft=jinja2
"au BufRead,BufNewFile *.log 		:%s/.\[3\d;1m//ge   "remove color code
"au BufRead,BufNewFile *.log 		:%s/.\[0m//ge       "remove color code
au BufRead,BufNewFile *.log 		:w!
au BufRead,BufNewFile *.log 		set modifiable!
au BufRead,BufNewFile *.log 		so  ~/.vim/plugged/logfile/logfile.vim
au BufRead,BufNewFile Makefile* 	set ft=make
au BufRead,BufNewFile *.lst 		set ft=asm
au BufRead,BufNewFile *.f 			set ft=c
au BufRead,BufNewFile *.h 			set ft=c
au BufRead,BufNewFile *.c 			set ft=c
au BufRead,BufNewFile *.cc 		set ft=systemC
au BufRead,BufNewFile *.cpp 		set ft=systemC
au BufRead,BufNewFile autorun 	set ft=tcsh

"---------------------------------------------------------------------------
" Auto syntax for filetype
"---------------------------------------------------------------------------
au FileType asm 					 	   source ~/.vim/plugged/asm/syntax/asm.vim
au FileType c 					 	      set dictionary +=~/.vim/plugged/C/C_dictionary.vim
au FileType c 					 	      source ~/.vim/plugged/C/syntax/C.vim
au FileType jinja2 						set dictionary +=~/.vim/plugged/jinja2/snipet_jinja2.vim
au FileType jinja2 						source ~/.vim/plugged/jinja2/snipet_jinja2.vim
au FileType jinja2 					 	source ~/.vim/plugged/jinja2/jinja2.vim
au FileType make 	                  set dictionary +=~/.vim/plugged/makefile/make_snipet.vim
au FileType make 	                  so ~/.vim/plugged/makefile/make_snipet.vim
au FileType nerdtree 					nmap J 10j
au FileType nerdtree 					nmap K 10k
au FileType netrw 						nmap <buffer> J 10j
au FileType netrw 						nmap <buffer> K 10k
au FileType netrw 						nmap <buffer> ma %
au FileType netrw 						nmap <buffer> md D
au FileType netrw 						nmap <buffer> u gg7j<cr>
au FileType python 					 	set dictionary +=~/.vim/plugged/python/py_dictionary.vim
au FileType python 					 	set dictionary +=~/.vim/plugged/python/py_snipet.vim
au FileType python 					 	set dictionary +=~/python_dir/tian_lib.py
au FileType python 					 	source ~/.vim/plugged/python/py_snipet.vim
au FileType python 					 	source ~/.vim/plugged/python/syntax/python.vim
au FileType systemC 					   source ~/.vim/plugged/system_C/systemC.vim
au FileType systemC 					   source ~/.vim/plugged/system_C/systemC_indent.vim
au FileType systemC 				      set dictionary +=~/.vim/plugged/system_C/systemC.vim
au FileType tagbar 					   nmap <buffer> <F1> :q!<cr>
au FileType tagbar 					   nmap <buffer> <space> 10j
au FileType verilog_systemverilog 	set dictionary +=~/.vim/plugged/verilog_systemverilog.vim/sv_snipet.vim
au FileType verilog_systemverilog 	set dictionary +=~/.vim/plugged/verilog_systemverilog.vim/uvm_keyword.vim
au FileType verilog_systemverilog 	source ~/.vim/plugged/verilog_systemverilog.vim/sv_snipet.vim

"-------------------------------------------------
" Declare default color
"-------------------------------------------------
au FileType * highlight Comment    ctermfg=107
au FileType * highlight Normal     ctermfg=252
au FileType * highlight Special    ctermfg=13
au FileType * highlight SpecialKey ctermfg=darkblue
au FileType * highlight Type       ctermfg=blue
au FileType * highlight Identifier ctermfg=blue
au FileType * highlight Directory  ctermfg=blue
au FileType * highlight netrwExe   ctermfg=gray
au FileType * highlight String     ctermfg=215
au FileType * highlight PreProc    ctermfg=13


"-------------------------------------------------
" For tagbar
"-------------------------------------------------
"verilog_systemverilog
let g:tagbar_type_verilog_systemverilog = {
    \ 'ctagstype' : 'systemverilog',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
        \ 'd:define',
        \ 'm:module',
        \ 't:task',
    \ ]
	 \ }

"-------------------------------------------------
" For syntastic
"-------------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"

"-------------------------------------------------
" Note
"-------------------------------------------------
" :r <file> 		insert raw file under cursor

