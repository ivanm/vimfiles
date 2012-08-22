VIM Dotfiles
========

Use it at your own risk.

::

  cd ~
  git clone https://ivanm@github.com/ivanm/dotfiles.git ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc
  cd ~/.vim
  git submodule init
  git submodule update
