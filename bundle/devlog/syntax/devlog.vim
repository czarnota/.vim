if exists("b:current_syntax")
    finish
endif

syntax sync minlines=200

syntax match devlogEntry "^\S.*$"
highlight link devlogEntry Statement
highlight devlogEntry gui=bold cterm=bold

syntax match devlogTimestamp "^\s\+--[0-9]\+:[0-9]\+--$"
highlight link devlogTimestamp Statement
highlight devlogTimestamp gui=bold cterm=bold

syntax match devlogTodo '^\s*\zs-\s\+\[ \]\s.*$'
"highlight devlogDone ctermfg=8 guifg=grey gui=strikethrough cterm=strikethrough
highlight link devlogTodo Todo

syntax match devlogTodoImportant '^\s*\zs-\s\+\[ \]\s\*.*$'
highlight devlogTodoImportant guibg=#8a0500 ctermbg=160

"syntax match devlogListTodo '^\s*\zs-\s\+\cTODO:\s.*$'
"highligh link devlogListTodo Todo

"syntax match devlogBlankLine '^\s*\n' nextgroup=devlogCodeLine
"syntax match devlogCodeLine '^\s\{4,4}\zs\s\{1,1}\ze\s\{3,3}.*$' contained nextgroup=devlogCodeLine skipnl
"highlight devlogCodeLine guibg=#3a3a3a ctermbg=237


" Blank line trigger - must consume the newline so the match is never
" zero-width (a zero-width match breaks skipnl/nextgroup chaining)
syntax match devlogBlankLine '^\s*\n' nextgroup=devlogCodeLineWrap

" Outer wrapper: matches a whole qualifying indented line (+ its newline).
" This is what actually drives the nextgroup chain from one code line to
" the next, since \zs/\ze in the inner rule would otherwise truncate the
" "official" match position used for nextgroup.
syntax match devlogCodeLineWrap '^\s\{4,4}\s\{1,1}\s\{3,3}.*\n' contained nextgroup=devlogCodeLineWrap contains=devlogCodeLineChar

" Inner rule: only highlights the single character at column 5.
" contained -> only reachable via devlogCodeLineWrap's contains=
syntax match devlogCodeLineChar '^\s\{4,4}\zs\s\{1,1}\ze\s\{3,3}' contained

highlight devlogCodeLineChar guibg=#3a3a3a ctermbg=237

let b:current_syntax = "devlog"
