function! Za()
"当前行注释或者取消注释"
    pyfile zhushi.py
endfunc

function! Zz()
"注释行
    python import sys
    python sys.argv = ['z']
    pyfile zhushi.py
endfunction

function! Zq()
"取消注释行
    python import sys
    python sys.argv = ['q']
    pyfile zhushi.py
endfunction
