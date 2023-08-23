" Autoload vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"
" Load plugins
"
if filereadable(expand("~/.config/vim/plugins.vimrc"))
  source ~/.config/vim/plugins.vimrc
endif

"
" Load local settings in .vimrc.local
"
if filereadable(expand("~/.config/vim/local.vimrc"))
    source ~/.config/vim/local.vimrc
endif
 