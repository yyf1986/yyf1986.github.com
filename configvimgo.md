```
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

`vim ~/.vimrc`
>set nocompatible              " be iMproved, required  
filetype off                  " required  
set rtp+=~/.vim/bundle/Vundle.vim  
call vundle#begin()  
Plugin 'gmarik/Vundle.vim'  
Plugin 'fatih/vim-go'  
call vundle#end()            " required  
filetype plugin indent on    " required

`vim ~/.vimrc`
>在vundle#begin和vundle#end间增加一行：
>Plugin 'fatih/vim-go'

### 代码提示，编辑模式下Ctl+x Ctl+o
### esc后，输入:GoImports，会自动导入包
### 光标移到函数上，gd会自动跳转到函数定义/GoDef，执行:b1退出
