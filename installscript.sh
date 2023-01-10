#!/bin/sh
#This is my custom script to install my window manager(s), configs, and apps. Feel free to use it!

#System update
sudo pacman -Syy
sudo pacman -Syu #to update all packages

#Required packages
sudo pacman -S git base-devel #(even though git would already be installed technically)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#Window manager install/config
sudo pacman -S awesome
git clone https://github.com/DrZhawitche/awesomewm-config.git
cd awesomewm-config
mkdir ~/.config/awesome/
cp rc.lua ~/.config/awesome/
#Installing the required apps
sudo pacman -S feh picom dmenu polkit-gnome volumeicon
#Copying the wallpapers 
mkdir ~/wallpapers
cp awesomewm-config/wallpapers/ ~/wallpapers/ -r

# (free) Apps
sudo pacman -S vim neovim alacritty libreoffice vlc zsh flameshot linux-headers virtualbox
yay -S librewolf-bin archtweak-tool-git brave-bin oh-my-zsh-git zsh-completions-git zsh-synthax-highlighting-git 
#Fun programs
sudo pacman -S lolcat neofetch cmatrix misfortune
yay -S cowsay-bin pfetch

# (non-free) Apps
sudo pacman -S discord

#Vim/Nvim configuration
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/DrZhawitche/vim-config.git
cd vim-config
cp .vimrc ~/
mkdir ~/.config/nvim/
cp .vimrc ~/.config/nvim/ && mv ~/.config/neovim/.vimrc ~/.config/nvim/init.vim
vim -c :PlugInstall && nvim -c :PlugInstall

#Alacritty config

#Zsh config

#