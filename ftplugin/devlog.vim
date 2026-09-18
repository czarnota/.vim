set ts=4 sw=4 expandtab

let g:switch_custom_definitions =
    \ [
    \    { '\(\s*\)- \[ \] \(.*\)': '\1- [x] \2' },
    \    { '\(\s*\)- \[x\] \(.*\)': '\1- [ ] \2' },
    \ ]


setlocal equalprg=true

function! MarkdownBraceReturn()
  let keys = AutoPairsReturn()
  if keys != ''
    let keys .= "\<C-t>"
  endif
  return keys
endfunction

function! s:InstallMarkdownBraceOverride()
  setlocal equalprg=true
  inoremap <buffer> <silent> <CR> <CR><C-R>=MarkdownBraceReturn()<CR>
endfunction

augroup MarkdownBraceIndent
  autocmd!
  autocmd InsertEnter <buffer> ++once call s:InstallMarkdownBraceOverride()
augroup END
