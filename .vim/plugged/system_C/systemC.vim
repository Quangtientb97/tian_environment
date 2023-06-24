syn region  systemC_comment      keepend start=+\/\*+ end=+\*\/+ containedin=ALL
syn region systemC_string start=+"+ skip=+\\"+ end=+"+ 

syn match systemC_braket 	"[.;(){}]" 		containedin=ALLBUT,systemC_comment
syn match systemC_comment 	"//.*" 			containedin=ALL
syn match systemC_type 		"\su\d\d*\s" 	containedin=ALL,systemC_comment
syn match systemC_type 		"\Wu\d\d*\W" 	containedin=ALL,systemC_comment,systemC_braket

syn match systemC_constant 	"\s[A-Z][A-Z][A-Z]\w*"      containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_constant 	"\W[A-Z][A-Z][A-Z]\w*"      containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_funtion 		"\s\w*("                    containedin=ALLBUT,systemC_braket,systemC_comment,systemC_condition
syn match systemC_funtion 		"\s\w*\s*("                 containedin=ALLBUT,systemC_braket,systemC_comment,systemC_condition
syn match systemC_funtion 		"\.\w\w*("                  containedin=ALLBUT,systemC_braket,systemC_comment,systemC_condition
syn match systemC_addr 			"[&|]"                      containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_not 			"!\w\w*"                    containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_not 			"#ifndef"                   containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_not 			"!="                        containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_not 			"\\[nr]"                    containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_not 			"%\d*[dx]"                  containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_index 		"\[\w*\]"                   containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_include 		"#\w*"                      containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_number 		"0b[01]*"                   containedin=ALLBUT,systemC_comment
syn match systemC_property 	"->\w\w*"                   containedin=ALLBUT,systemC_comment
syn match systemC_datatype 	"\s*sc_\w\w*"               containedin=ALLBUT,systemC_comment
syn match systemC_len 		   "<\d\d*>"                   containedin=ALLBUT,systemC_braket,systemC_comment,systemC_string

syn match systemC_red 		   "<<"                   containedin=ALLBUT,systemC_braket,systemC_comment
syn match systemC_red 		   "*"                   containedin=ALLBUT,systemC_braket,systemC_comment

syn match systemC_number 		   "\d\d*"                   containedin=ALLBUT,systemC_braket,systemC_comment,systemC_string

syn keyword systemC_datatype 	bool void virtual             containedin=ALLBUT,systemC_comment
syn keyword systemC_datatype 	cout endl new int            containedin=ALLBUT,systemC_comment
syn keyword systemC_datatype 	constant char             containedin=ALLBUT,systemC_comment
syn keyword systemC_condition if else return do while for containedin=ALLBUT,systemC_braket,systemC_comment,systemC_include,systemC_string
syn keyword systemC_condition class public private containedin=ALLBUT,systemC_braket,systemC_comment,systemC_include


syn match systemC_keyword  "\s*SC_\w\w*" containedin=ALLBUT,systemC_braket,systemC_comment,systemC_include



highlight systemC_funtion   ctermfg=blue"139
highlight systemC_datatype  ctermfg=blue
highlight systemC_braket    ctermfg=251
highlight systemC_comment   ctermfg=107
highlight systemC_constant  ctermfg=cyan
highlight systemC_type      ctermfg=blue
highlight systemC_addr      ctermfg=red
highlight systemC_not       ctermfg=42
highlight systemC_index     ctermfg=42
highlight systemC_condition ctermfg=176"139
highlight systemC_keyword   ctermfg=176
highlight systemC_include   ctermfg=139
highlight systemC_number    ctermfg=brown
highlight systemC_property  ctermfg=215
highlight systemC_len       ctermfg=13
highlight systemC_string    ctermfg=yellow
highlight systemC_red       ctermfg=brown
highlight systemC_number       ctermfg=brown
highlight Statement   		 ctermfg=139
highlight Normal      		 ctermfg=254

set dictionary+=~/gen_aarch32_reg/cpu.c


"--------------------------------"
"	for completion                "
"--------------------------------"
" SC_MODULE SC_CTOR SC_METHOD
" sensitive
