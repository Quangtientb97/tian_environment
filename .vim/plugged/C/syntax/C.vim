syn match C_constant 	"\s[A-Z][A-Z][A-Z]\w*"      containedin=ALLBUT,C_braket,C_comment
syn match C_constant 	"\W[A-Z][A-Z][A-Z]\w*"      containedin=ALLBUT,C_braket,C_comment
syn match C_funtion 		"\s\w*("                    containedin=ALLBUT,C_braket,C_comment,C_condition
syn match C_funtion 		"\s\w*\s*("                 containedin=ALLBUT,C_braket,C_comment,C_condition
syn match C_addr 			"[&|]"                      containedin=ALLBUT,C_braket,C_comment
syn match C_not 			"!\w\w*"                    containedin=ALLBUT,C_braket,C_comment
syn match C_not 			"#ifndef"                   containedin=ALLBUT,C_braket,C_comment
syn match C_not 			"!="                        containedin=ALLBUT,C_braket,C_comment
syn match C_not 			"\\[nr]"                    containedin=ALLBUT,C_braket,C_comment
syn match C_not 			"%\d*[dx]"                  containedin=ALLBUT,C_braket,C_comment
syn match C_index 		"\[\w*\]"                   containedin=ALLBUT,C_braket,C_comment
syn match C_include 		"#\w*"                      containedin=ALLBUT,C_braket,C_comment
syn match C_number 		"0b[01]*"                   containedin=ALLBUT,C_comment
syn match C_property 	"->\w\w*"                   containedin=ALLBUT,C_comment
syn keyword C_condition if else return do while for containedin=ALLBUT,C_braket,C_comment,C_include

syn match C_braket 	"[;(){}]" 		containedin=ALLBUT,C_comment
syn match C_comment 	"//.*" 			containedin=ALL
syn match C_type 		"\su\d\d*\s" 	containedin=ALL,C_comment
syn match C_type 		"\Wu\d\d*\W" 	containedin=ALL,C_comment,C_braket

syn region  C_comment      start=+\/\*+ end=+\*\/+ containedin=ALL

highlight C_funtion   ctermfg=blue"139
highlight C_braket    ctermfg=251
highlight C_comment   ctermfg=107
highlight C_constant  ctermfg=cyan
highlight C_type      ctermfg=blue
highlight C_addr      ctermfg=red
highlight C_not       ctermfg=42
highlight C_index     ctermfg=42
highlight C_condition ctermfg=176"139
highlight C_include   ctermfg=139
highlight C_number    ctermfg=brown
highlight C_property  ctermfg=215
highlight Statement   ctermfg=139
highlight Normal      ctermfg=254

set dictionary+=~/gen_aarch32_reg/cpu.c
