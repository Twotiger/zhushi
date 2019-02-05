# -*- coding: utf-8 -*-
import vim
import sys



def note(notestr, flag=None):
    cur_buf = vim.current.buffer
    start = vim.current.range.start
    end = vim.current.range.end
    if start > end:
        start, end = end, start

    if flag == 'q' or (flag is None and (cur_buf[start]).lstrip().startswith(notestr)):
        # 取消注释
        for i in range(start, end + 1):
            if cur_buf[i].lstrip().startswith(notestr):
                cur_buf[i] = cur_buf[i].replace('%s '% notestr, '', 1)
            # if code == cur_buf[i]: 
                # cur_buf[i] = cur_buf[i].replace(notestr, '', 1)
            #else: 
            #    cur_buf[i] = code
    else: 
        # 注释
        for i in range(start, end+1):
            if cur_buf[i]:    # 预防空行操作
                front = ''
                for num, j in enumerate(cur_buf[i]):
                    if j.isspace():
                        front += j
                    else: 
                        cur_buf[i] = front + notestr + ' ' + cur_buf[i][num:]    
                        break

def fb(notestr, flag=None):
    cur_buf = vim.current.buffer
    start = vim.current.range.start
    end = vim.current.range.end
    if start > end:
        start, end = end, start
    if flag == 'q' or cur_buf[start].lstrip().startswith(notestr[0]):
        # 取消注释
        for i in range(start, end + 1):
            if cur_buf[i]:
                cache = cur_buf[i]
                if cache.find('%s ' % notestr[0]) >= 0:
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


def main(flag=None):
    filetype = vim.eval('&filetype')
    if filetype in ("python", "cucumber"): # 
        note('#', flag)
    elif filetype == 'vim':   # if filetype is vim
        note('"', flag)
    elif filetype in("c", "javascript", "cpp"):
        note('//', flag)
    elif filetype == 'htmldjango':
        fb(('{#', '#}'), flag)
    elif filetype in ('html', 'vue'):
        fb(('<!--', '-->'), flag)
    elif filetype == 'css':
        fb(("/*", "*/"), flag)
    elif filetype == "javascript.jsx":
        fb(('{/*', '*/}'), flag)

