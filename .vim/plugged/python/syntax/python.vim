syn match   python_braket      "[;()={}.]" containedin=ALLBUT,python_string,python_not
syn match   python_function    "\.\w*(" containedin=ALLBUT,python_braket,python_string
syn match   python_function    "\s\w*(" containedin=ALLBUT,python_braket,python_string
syn match   python_constant    "[A-Z][A-Z][A-Z_]*" containedin=ALLBUT,Comment,python_string,python_not
syn keyword python_statement   if else while elif for in def return
syn region  python_string      start=+"+ skip=+\\"+ end=+"+ 
syn match  python_not         "!=" containedin=ALLBUT,Comment
syn match  python_not         "\[\w*\]" containedin=ALLBUT,Comment
syn match  python_not         "{\w*}" containedin=ALLBUT,Comment
syn match  python_not         "\\n" containedin=ALLBUT,Comment
syn match  python_constant         "__\d\d*__" containedin=python_string


highlight python_function ctermfg=blue
highlight python_braket   ctermfg=white
highlight python_string   ctermfg=215
highlight python_constant   ctermfg=13
highlight python_statement   ctermfg=176
highlight Normal   ctermfg=253
highlight python_not   ctermfg=70
