""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""
function! Load_cscope()
    let b:cspath = system("$HOME/bin/cskeeper")
    if strlen(b:cspath)
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
    try
        call system("$HOME/bin/cskeeper")
        cs reset
    catch
        return
    endtry
endfunction

autocmd FileType c,cpp,h cabbrev w silent call Save_and_update_cscope()<CR>
autocmd FileType c,cpp,h silent call Load_cscope()
