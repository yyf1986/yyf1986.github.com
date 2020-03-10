```
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

`vim ~/.vimrc`
> set nocompatible              " be iMproved, required  
filetype off                  " required  
set rtp+=~/.vim/bundle/Vundle.vim  
call vundle#begin()  
Plugin 'gmarik/Vundle.vim'  
Plugin 'fatih/vim-go'  
call vundle#end()            " required  
filetype plugin indent on    " required

`vim ~/.vimrc`
> 在vundle#begin和vundle#end间增加一行：
> Plugin 'fatih/vim-go'

vim打开
执行:PluginInstall
一开始会有process，一会以后会有done，关闭
vim打开
执行:GoInstallBinaries

### 代码提示，编辑模式下Ctl+x Ctl+o
### esc后，输入:GoImports，会自动导入包
### 光标移到函数上，gd会自动跳转到函数定义/GoDef，执行:b1退出


### 集成工具
```
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/lukehoban/go-find-references
go get -u -v github.com/lukehoban/go-outline
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v github.com/tpng/gopkgs
go get -u -v github.com/newhook/go-symbols
go get -u -v sourcegraph.com/sqs/goreturns
```

> 下载不了的包，可以通过https://gopm.io/ 来下载，然后在go install
