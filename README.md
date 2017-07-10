# zhushi
vim plugin

这是vim的一个插件, 可以注释和取消注释代码.

### 需求
vim 要支持 python


### 支持语言
`python`  `vim` `c` `javascript` `cucumber` `htmldjango` `html` `css` `javascript.jsx`

javascript.jsx,需要安装[vim-jsx](https://github.com/mxw/vim-jsx)

建议设置
```
let mapleader=","
map <leader>a :call Za()<CR>
map <leader>z :call Zz()<CR>
map <leader>q :call Zq()<CR>
```

函数Za 会取消或注释代码

函数Zz 只会注释代码,如果代码已经被注释了, 还会加一层注释

函数Zq 只会取消注释

### Vundle 安装
`Plugin 'Twotiger/zhushi'`

### 手动安装
复制plugin中的文件 到自己plugin的目录下


### 多行注释:

`3,z`  注释3行

