Installation
========
Clone Repo
```
git clone https://github.com/ivanm/vimfiles.git ~/.vimfiles
```

NeoVim
```
cd ~/.vimfiles/
./link-nvim.sh
```

Vim
```
cd ~/.vimfiles/
./link-vim.sh
```

Direct Download
========

Vim:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
curl https://raw.githubusercontent.com/ivanm/vimfiles/master/vim/vimrc > ~/.vimrc; \
vim +PlugInstall +qall
```

NeoVim:
```
rm -rf ~/.config/nvim; \
mkdir ~/.config/nvim; \
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
curl https://raw.githubusercontent.com/ivanm/vimfiles/master/nvim/init.vim >  ~/.config/nvim/init.vim; \
nvim +PlugInstall +qall
```
