function s:hilist()
    syn match LRejected /\s*\(\d\.\|\*\) \[-\]/hs=s+2
    syn match LDone0    /\s*\(\d\.\|\*\) \[ \]/hs=s+2
    syn match LDone1    /\s*\(\d\.\|\*\) \[\.\]/hs=s+2
    syn match LDone2    /\C\s*\(\d\.\|\*\) \[o\]/hs=s+2
    syn match LDone3    /\C\s*\(\d\.\|\*\) \[O\]/hs=s+2
    syn match LDone4    /\s*\(\d\.\|\*\) \[X\]/hs=s+2

    hi LRejected ctermfg=160
    hi LDone0    ctermfg=245
    hi LDone1    ctermfg=32
    hi LDone2    ctermfg=34
    hi LDone3    ctermfg=42 
    hi LDone4    ctermfg=40 
endfunction

au BufNewFile,BufRead,BufEnter,BufWinEnter *.md,*.wiki setl syntax=markdown
au BufNewFile,BufRead,BufEnter,BufWinEnter *.md,*.wiki call s:hilist()
