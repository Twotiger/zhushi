python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))


function! Za()
"当前行注释或者取消注释"
python << endPython
import zhushi
reload(zhushi)
zhushi.main()
endPython
endfunc

function! Zz()
"注释行
python << endPython
import zhushi
reload(zhushi)
zhushi.main('z')
endPython
endfunction

function! Zq()
"取消注释行
python << endPython
import zhushi
reload(zhushi)
zhushi.main('q')
endPython
endfunction
