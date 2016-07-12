# zhushi
vim plugin

这是vim的一个插件, 可以注释和取消注释代码.

###需求
vim 要支持 python


支持python, vim, c , javascript

javascript 中可以支持jsx格式语法,需要安装[vim-jsx](https://github.com/mxw/vim-jsx)

建议设置
```
let mapleader=","
map <leader>a :call Za()<CR>
map <leader>z :call Zhushi()<CR>
map <leader>q :call Quxiaozhushi()<CR>
```

函数Za 会取消或注释代码

函数Zhushi 只会注释代码,如果代码已经被注释了, 还会加一层注释

函数Quxiaozhushi 只会取消注释

###Vundle 安装
`Plugin 'Twotiger/zhushi'`

###手动安装
复制plugin/zhushi.vim 到自己plugin的目录下


###多行注释:

`3,z`  注释3行




