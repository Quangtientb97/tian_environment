syn match log_Info "UVM_INFO"
syn match log_Error "UVM_ERROR" 
syn match log_Fatal "UVM_FATAL" 
syn match log_Waring "UVM_WARNING" 
syn match log_Hierachy "\s\w\w*\.[a-zA-Z_.0-9-\[\]][a-zA-Z_.0-9-\[\]]*" 
syn match log_Hierachy "(\w\w*\.[a-zA-Z_.0-9-\[\]][a-zA-Z_.0-9-\[\]]*)" 
syn match log_Hierachy "\[\w\w*\.[a-zA-Z_.0-9-\[\]][a-zA-Z_.0-9-\[\]]*\]" 
syn match log_Link "\s\/[a-zA-Z_/0-9-.]*"
"syn region log_Comment start=+-[-]*\n+ end=+\n-[-]*\n+ 

highlight   log_Hierachy   ctermfg=215
highlight   log_Link       ctermfg=blue
highlight   log_Info       cterm=underline ctermfg=blue      
highlight   log_Error      cterm=underline ctermfg=darkred   
highlight   log_Fatal      cterm=underline ctermfg=176       
highlight   log_Waring     cterm=underline ctermfg=228    
"highlight   log_Comment    ctermfg=107
