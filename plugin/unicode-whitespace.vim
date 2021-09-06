" Vim plugin
" Author: Flammie A Pirinen
" Repository: https://github.com/flammie/vim-unicode-whitespace
" with some copypaste from: https://github.com/ntpeters/vim-better-whitespace
" (does not need most of its functionality so I tried to make it lighter...)

" Prevent loading the plugin multiple times
if exists('g:loaded_unicode_whitespace_plugin')
    finish
endif
let g:loaded_unicode_whitespace_plugin = 1

syn sync clear

" not including space and nbsp that are handled by listchars
let s:whitespace_chars='\u1680\u180e\u2000-\u200a\u205f\u2060\u3000'
let s:whitespace_pattern='[' . s:whitespace_chars . ']'
let s:whitespacecolor='#82a598'
" Ensure the 'UnicodeWhitespace' highlight group has been defined
function! s:UnicodeWhitespaceInit()
    " Check if the user has already defined highlighting for this group
    if hlexists('UnicodeWhitespace') == 0 || empty(synIDattr(synIDtrans(hlID('UnicodeWhitespace')), 'bg'))
        execute 'highlight UnicodeWhitespace cterm=undercurl gui=undercurl guisp=' . s:whitespacecolor
    endif
endfunction

function! s:HighlightUnicodeWhitespace()
    silent! call matchdelete(get(s:, 'match_id', -1))
    " have to use matchadd here, syn match does not work for whatever reason
    let s:match_id = matchadd('UnicodeWhitespace', s:whitespace_pattern, 10, get(s:, 'match_id', -1))
endfunction

" Sets up (or removes) all auto commands in the buffer, after checking the
" per-buffer settings. Also performs an initial highlighting (or clears it).
function! <SID>SetupAutoCommands()
    augroup unicode_whitespace
        " Reset all auto commands in group
        autocmd!
        call <SID>UnicodeWhitespaceInit()
        " Highlight extraneous whitespace at the end of lines, but not the current line in insert mode.
        call <SID>HighlightUnicodeWhitespace()
        autocmd CursorMovedI,InsertEnter * call <SID>HighlightUnicodeWhitespace()
        autocmd InsertLeave,BufReadPost * call <SID>HighlightUnicodeWhitespace()

    augroup END
endfunction

autocmd FileType,WinEnter,BufWinEnter * call <SID>SetupAutoCommands()
autocmd ColorScheme * call <SID>UnicodeWhitespaceInit()

