function! Sign()
" 删除指定的符号
" 当在2个字符中间的时候,如果这行匹配偶数个该符号,删除这个2个符号
python << EOF
import vim

sign = "'"
x, y = vim.current.window.cursor

line = vim.current.line
s = [] # sign list
flag = 0
#if line.find(sign) & 2 == 0:
for i, value in enumerate(line):
    if value == sign:
        s.append(i)
        if i >= y:
            break

vim.current.line = line[:s[-2]] + line[s[-2]+1:s[-1]] + line[s[-1]+1:]
EOF
endfunction

