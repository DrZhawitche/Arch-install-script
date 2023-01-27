#! bin/sh
#This is my custom script to install my window manager(s), configs, and apps. Feel free to use it!

#Required packages
sudo pacman -S base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#Window manager install
sudo pacman -S awesome qtile python-wlroots lxappearance picom flameshot polkit-gnome volumeicon feh dmenu rofi
yay -S hyrpland-git qtile-extras-git waybar swaybg wofi

cd dotfiles
rm -r .confile/qtile .config/awesome .config/hypr
mv dotfiles/.config/qtile/ dotfiles/.config/hyr/ dotfiles/.config/awesome .config/

# (free) Apps
sudo pacman -S vim neovim alacritty libreoffice vlc zsh flameshot linux-headers virtualbox
yay -S librewolf-bin archlinux-tweak-tool-git arcolinux-logout arcolinux-arc-aqua-git zsh-completions-git zsh-synthax-highlighting-git starship
#Fun programs
sudo pacman -S lolcat neofetch cmatrix misfortune
yay -S cowsay-bin pfetch

# (non-free) Apps
sudo pacman -S discord

#Vim configuration
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/DrZhawitche/vim-config.git
mv dotfiles/.vimrc ~
vim -c :PlugInstall

#Alacritty config
mv dotfiles.config/alacritty/ .config

#Zsh config
rm .config/.zshrc
mv dotfiles/.zshrc .config/

# Moving other miscellanous files
mv dotfiles/.config/autostart.sh .config/

# Installing doom emacs
sudo pacman -S emacs
git clone --depth 1 --single-branch https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
