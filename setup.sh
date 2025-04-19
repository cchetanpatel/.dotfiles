#!/bin/bash

git clone https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme.git $HOME/.dotfiles/.themes/Tokyonight-GTK-Theme

ln -s $HOME/.dotfiles/.config/sway $HOME/.config/sway 2>>/dev/null
ln -s $HOME/.dotfiles/.config/rofi $HOME/.config/rofi 2>>/dev/null
ln -s $HOME/.dotfiles/.config/Thunar $HOME/.config/Thunar 2>>/dev/null
ln -s $HOME/.dotfiles/.config/waybar $HOME/.config/waybar 2>>/dev/null
ln -s $HOME/.dotfiles/.config/gtk-3.0 $HOME/.config/gtk-3.0 2>>/dev/null
ln -s $HOME/.dotfiles/.config/gtk-4.0 $HOME/.config/gtk-4.0 2>>/dev/null
ln -s $HOME/.dotfiles/.config/ghostty $HOME/.config/ghostty 2>>/dev/null

ln -s $HOME/.dotfiles/.config/backgrounds $HOME/.config/backgrounds 2>>/dev/null

rm $HOME/.bashrc
ln -s $HOME/.dotfiles/.bashrc $HOME/.bashrc 2>>/dev/null
rm $HOME/.bash_profile
ln -s $HOME/.dotfiles/.bash_profile $HOME/.bash_profile 2>>/dev/null
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc 2>>/dev/null


