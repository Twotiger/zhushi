function! Addsign()
echom 'start'
python << EOF
from vim import *


x, y = current.window.cursor
EOF
endfunction
