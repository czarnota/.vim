if exists("b:current_syntax")
    finish
endif

syntax match devlogEntry "^\S.*$"
highlight link devlogEntry Statement
highlight devlogEntry gui=bold cterm=bold

syntax match devlogTimestamp "^\s\+--[0-9]\+:[0-9]\+--$"
highlight link devlogTimestamp Statement
highlight devlogTimestamp gui=bold cterm=bold

syntax match devlogTodo '^\s*\zs-\s\+\[ \]\s.*$'
"highlight devlogDone ctermfg=8 guifg=grey gui=strikethrough cterm=strikethrough
highligh link devlogTodo Todo

"syntax match devlogListTodo '^\s*\zs-\s\+\cTODO:\s.*$'
"highligh link devlogListTodo Todo

let b:current_syntax = "devlog"
