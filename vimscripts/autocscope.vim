""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""
function! Load_cscope()
    let b:cspath = system("$HOME/bin/cskeeper")
    if !empty(b:cspath)
        let ccommand = "cs add ".b:cspath
        try
            exe ccommand
        catch
            return
        endtry
    else
        return
    endif
endfunction

function! Save_and_update_cscope()
    w
    let b:cspath = system("$HOME/bin/cskeeper")
    if !empty(b:cspath)
        try
            cs reset
        catch
            return
        endtry
    endif
endfunction

autocmd FileType c,cpp,h cabbrev w silent call Save_and_update_cscope()<CR>
autocmd FileType c,cpp,h silent call Load_cscope()
