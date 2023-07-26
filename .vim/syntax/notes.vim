" Vim syntax file
" Language: Notes
"
" Simple syntax highlighting for plaintext notes. For anything more advanced
" probably use markdown, or perhaps check out https://github.com/xolox/vim-notes

" Quit when a syntax file was already loaded
if exists('b:current_syntax') | finish | endif

set commentstring=#%s

syntax keyword notesTodo TODO FIXME NOTE README
syntax keyword notesTodoComment contained TODO FIXME NOTE README
syntax match notesComment "#.*$" contains=notesTodoComment,@notesInline
syntax match notesNumber "\d\+"
syntax region notesString start=+[uU]\=\z([`'"]\)+ end="\z1" skip="\\\\\|\\\z1"
syntax match notesBlockquote ">\%(\s\|$\).*" contains=notesTodoComment,@notesInline
highlight notesTodo ctermfg=132 cterm=bold
highlight notesTodoComment ctermfg=132 cterm=bold
highlight default link notesComment Comment
highlight default link notesNumber Constant
highlight default link notesString String
highlight default link notesBlockquote String

" Credits: https://github.com/xolox/vim-notes (modified)
syntax match notesTextURL @\<www\.\(\S*\w\)\+/\?@
execute printf('syntax match notesRealURL @%s@', '\<\(mailto:\|\w\{3,}://\)\(\S*\w\)\+/\?')
syntax match notesEmailAddr /\<\w[^@ \t\r]*\w@\w[^@ \t\r]\+\w\>/
syntax match notesUnixPath /\k\@<![\/~]\S\+\(\/\|[^ [:punct:]]\)/
syntax match notesPathLnum /:\d\+/ contained containedin=notesUnixPath
syntax cluster notesInline add=notesTextURL,notesRealURL,notesEmailAddr,notesUnixPath
highlight default link notesTextURL Underlined
highlight default link notesRealURL Underlined
highlight default link notesEmailAddr Underlined
highlight default link notesUnixPath Directory
highlight default link notesPathLnum Comment

let b:current_syntax = 'notes'
