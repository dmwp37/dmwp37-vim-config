vim config project

Install

1. install vundle and curl first

use vundle to manage plugins

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

2. cp _vimrc ~/.vimrc
3. :BundleInstall
4. need to build vimproc for different platforms
5. need to change TagHighlight HEAD
6. clang_complete need libclang and python installed

install msysgit for vundle under windows, please read vundle docs

you can download libclang from
http://www.ishani.org/web/articles/code/clang-win32/

vim: ft=text
