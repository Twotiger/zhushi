function! Za()
"当前行注释或者取消注释"
python << EOF
import vim
cur_buf = vim.current.buffer
start = vim.current.range.start
end = vim.current.range.end
if start > end :
    start, end = end, start
def note(notestr):
    if (cur_buf[start]).lstrip().startswith(notestr):
        # 取消注释
        for i in range(start, end+1):
            if cur_buf[i]:
                code = cur_buf[i].replace(notestr+' ', '', 1)
            if code == cur_buf[i]: # 预防碰到 #s = 'b'
		        cur_buf[i] = cur_buf[i].replace(notestr, '', 1)
            else:# '18
                cur_buf[i] = code
	        
    else: # 注释
        for i in range(start, end+1):
            if cur_buf[i]:	# 预防空行操作
                front = ''
                for num, j in enumerate(cur_buf[i]):
                    if j.isspace():
                        front += j
                    else: # 'asdf2'
                        cur_buf[i] = front + notestr + ' ' + cur_buf[i][num:]	
                        break
def fb(notestr):
    if cur_buf[start].lstrip().startswith(notestr[0]):
        # 取消注释
        for i in range(start, end+1):
            if cur_buf[i]:
                cache = cur_buf[i]
                if cache.find(notestr[0]+' ') >= 0:
                    cache = cache.replace(notestr[0]+' ', '', 1)
                else: # asdf
                    cache = cache.replace(notestr[0], '', 1)
                hm = cache.rindex(notestr[1])
                cur_buf[i] = cache[:hm]

    else: # 注释
        for i in range(start, end+1):
            if cur_buf[i]:
                front = ''
                for num, j in enumerate(cur_buf[i]):
                    if j.isspace():
                        front += j
                    else:
                        cur_buf[i] = front + notestr[0] + ' ' + cur_buf[i][num:] + ' ' + notestr[1]
                        break
    
def main():
    filetype = vim.eval('&filetype')
    if filetype in ("python", "cucumber"): # if filetype is python
        note('#')
    elif filetype == 'vim':   # if filetype is vim
        note('"')
    elif filetype in("c", "javascript", "javascript.jsx"):
        note('//')
    elif filetype == 'htmldjango':
        fb(('{#', '#}'))
    elif filetype == 'html':
        fb(('<!--', '-->'))
        
main()
#print filetype,'ok'
    
EOF
endfunction
function! Zhushi()
"注释行
python << EOF
import vim
cur_buf = vim.current.buffer
start = vim.current.range.start
end = vim.current.range.end
if start > end :
    start, end = end, start
def note(notestr):
    for i in range(start, end+1):
        if cur_buf[i]:
            cur_buf[i] = notestr + cur_buf[i]

def fb(notestr):
    for i in range(start, end+1):
        if cur_buf[i]:
            front = ''
            for num, j in enumerate(cur_buf[i]):
                if j.isspace():
                    front += j
                else:
                    cur_buf[i] = front + notestr[0] + ' ' + cur_buf[i][num:] + ' ' + notestr[1]
                    break

def main():
    filetype = vim.eval('&filetype')
    if filetype in ("python", "cucumber"):
        note('#')
    elif filetype == 'vim':   # if filetype is vim
        note('"')
    elif filetype in("c", "javascript", "javascript.jsx"):
        note('//')
    elif filetype == 'htmldjango':
        fb(("{#", "#}"))
    elif filetype == 'html':
        fb(("<!--", "-->"))
main()
EOF
endfunction
function! Quxiaozhushi()
"取消注释行
python << EOF
import vim
cur_buf = vim.current.buffer
start = vim.current.range.start
end = vim.current.range.end
if start > end :
    start, end = end, start
def note(notestr):
    for i in range(start, end+1):
        if (cur_buf[start]).lstrip().startswith(notestr):
            if cur_buf[i] and cur_buf[i].startswith(notestr):
                cur_buf[i] = cur_buf[i][len(notestr):]

def fb(notestr):
    for i in range(start, end+1):
        if cur_buf[start].lstrip().startswith(notestr[0]):
            # 取消注释
            if cur_buf[i]:
                cache = cur_buf[i]
                if cache.find(notestr[0]+' ') >= 0:
                    cache = cache.replace(notestr[0]+' ', '', 1)
                else: # asdf
                    cache = cache.replace(notestr[0], '', 1)
                hm = cache.rindex(notestr[1])
                cur_buf[i] = cache[:hm]
        


def main():
    filetype = vim.eval('&filetype')
    if filetype in ("python", "cucumber"):
        note('#')
    elif filetype == 'vim':   # if filetype is vim
        note('"')
    elif filetype in("c", "javascript", "javascript.jsx"):
        note('//')
    elif filetype == 'htmldjango':
        fb(("{#", "#}"))
    elif filetype == 'html':
        fb(("<!--", "-->"))
    

main()
EOF
endfunction
