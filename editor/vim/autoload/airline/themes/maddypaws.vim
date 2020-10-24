" Minimalist Airline - A Material Color Scheme
"
" Author:       Diki Ananta <diki1aap@gmail.com>
" Repository:   https://github.com/dikiaap/minimalist
" Version:      2.0
" License:      MIT

let s:theme = 'maddypaws'

" To highlight when the buffer is modified:
"     let g:airline_minimalist_showmod = 1
let s:want_showmod = get(g:, 'airline_minimalist_showmod', 0)

function! airline#themes#{s:theme}#refresh()
    if &background == "dark"
        " Normal
        let N1 = [ '#E4E4E4', '#3A3A3A', 242, 'NONE' ]

        " Insert
        let I1 = [ '#E4E4E4', '#3A3A3A', 68, 'NONE' ]

        " Modified
        let M1 = [ '#E4E4E4', '#3A3A3A', 23, 'NONE' ]
        
        " Replace
        let R1 = [ '#E4E4E4', '#3A3A3A', 132, 'NONE' ]

        " Inactive
        let IA = [ '#666666', N1[1], 242, N1[3] ]

        " Error
        " let ER = [ '#1C1C1C', '#D75F5F', 234, 167 ]
        let ER = [ N1[0], '#D75F5F', N1[2], 16 ]

        " Warning
        let WI = N1 " [ N1[0], '#FFAF5F', 25, 0 ]
    else
        " Normal
        let N1 = [ 'gray30', 'gray70', 235, 249 ]

        " Inactive
        let IA = [ 'gray15', N1[1], 244, N1[3] ]

        " Error
        let ER = [ '#1C1C1C', '#D75F5F', 234, 167 ]

        " Warning
        let WI = [ ER[0], '#FFAF5F', ER[2], 215 ]
    endif

    " Terminal
    let TE = [ ER[0], N1[1], N1[2], N1[3] ]

    " Reverse
    let NR = [ N1[1], N1[0], N1[3], N1[2], 'bold' ]


    let palette = {}

    let palette.normal = airline#themes#generate_color_map(N1, N1, N1)
    let palette.normal.airline_error   = ER
    let palette.normal.airline_warning = WI
    let palette.normal.airline_term    = TE

    let palette.insert   = airline#themes#generate_color_map(I1, I1, I1)
    let palette.insert.airline_error   = ER
    let palette.insert.airline_warning = WI
    let palette.insert.airline_term    = TE
    
    let palette.replace   = airline#themes#generate_color_map(R1, R1, R1)
    let palette.replace.airline_error   = ER
    let palette.replace.airline_warning = WI
    let palette.replace.airline_term    = TE
    
    let palette.visual   = palette.normal
    let palette.inactive = airline#themes#generate_color_map(IA, IA, IA)
    let palette.inactive.airline_error   = ER
    let palette.inactive.airline_warning = WI
    let palette.inactive.airline_term    = TE
    let palette.commandline = palette.inactive

    if s:want_showmod
        let palette.normal_modified = airline#themes#generate_color_map(M1, N1, M1)
        let palette.normal_modified.airline_error   = ER
        let palette.normal_modified.airline_warning = WI
        let palette.normal_modified.airline_term    = TE
    endif

    " Accents
    let palette.accents = {
                \ 'red': [ ER[1], '', ER[3], '' ],
                \ 'orange': [ ER[1], '', ER[3], ''],
                \ 'yellow': [ ER[1], '', ER[3], '']
                \ }

    " CtrlP
    if get(g:, 'loaded_ctrlp', 0)
        let palette.ctrlp = airline#extensions#ctrlp#generate_color_map(N1, N1, NR)
    endif

    let g:airline#themes#{s:theme}#palette = palette
endfunction

call airline#themes#{s:theme}#refresh()
