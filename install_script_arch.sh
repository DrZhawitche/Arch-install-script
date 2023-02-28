#!/bin/sh

corepackages=("base-devel" "git")
packages=("vim" "emacs" "qtile" "volumeicon" "zsh" "nitrogen" "networkmanager" "alacritty" "polkit-gnome" "flameshot")
echo "Use [D]efault picom or picom-jonaburg [F]ork (for animations)? [D]/[F] "
read picom
if [ $picom = "D" ]; then
	aurpackages=("librewolf-bin" "pfetch" "webcord-bin" "brave-bin" "qtile-extras" "picom")
elif [ $picom = "F" ]; then
	aurpackages=("librewolf-bin" "pfetch" "webcord-bin" "brave-bin" "qtile-extras" "picom-jonaburg-git")
else
	echo "Invalid input, re-run script."
fi

pacman="sudo pacman -S --needed"
$pacman $corepackages $packages

#Installing yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay="yay -S --needed"

#Installing aur packages
$yay $aurpackages

#Config files
mv ~/.config ~/.config-old
echo "Old .config folder has been renamed .config-old."
cd ~
git clone https://github.com/DrZhawitche/dotfiles.git
rm -rf ~/.config
mv ~/dotfiles/.config ~

#Some vim stuff
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.config/vim/plugins

#Symbolics links for zsh, bash and vim
ln -s ~/.config/zsh/.zshrc ~/.zshrc
ln -s ~/.config/bash/.bash ~/.bash
ln -s ~/.config/vim/.vimrc ~/.vimrc
ln -s ~/.config/vim/plugins ~/.vim/

echo "Everything should be installed now, to install the vim plugins, open vim and run :PlugInstall."
