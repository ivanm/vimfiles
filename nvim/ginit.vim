if exists('g:GuiLoaded')
  GuiFont Inconsolata for Powerline:h11
endif
if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Inconsolata for Powerline 11')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
endif
