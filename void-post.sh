#! /bin/bash

#creating necessary directories
mkdir ~/.local
mkdir ~/.local/share/
mkdir ~/.cache
mkdir ~/pix
mkdir ~/pix/scrot
mkdir ~/dl
mkdir ~/code
mkdir ~/dox
mkdir ~/music
mkdir ~/.config
mkdir ~/.vim

# ~/ cleanup
mkdir ~/.local/share/task
touch ~/.local/share/taskrc
mkdir ~/.config/less
touch ~/.config/less/lesskey
mkdir ~/.config/readline
touch ~/.config/readline/inputrc
mkdir ~/.local/share/zsh/
touch ~/.local/share/zsh/history
mkdir ~/.local/share/gnupg
mkdir ~/.local/share/pass

#installing needed packages (or just what i use ;) )
sudo xbps-install -Sy gnupg pass passmenu ueberzug tlp ffmpeg sox alsa-tools xdg-utils font-awesome5 xclip tmux zathura zathura-pdf-poppler acpid newsboat xsetroot tree alsa-lib-devel NetworkManager alsa-utils dbus patch curl xrandr xorg-minimal xorg-fonts xf86-input-evdev xf86-input-synaptics xf86-video-fbdev xf86-video-intel mesa mesa-dri intel-video-accel gcc libXinerama-devel libXft-devel freetype-devel libX11-devel ncurses-term qutebrowser youtube-dl dunst sxhkd unclutter zsh cmus maim feh fzf ranger vim-x11 mpv fontconfig-devel setxkbmap picom task htop xbacklight slock make pkg-config xf86-video-intel xf86-input-libinput font-cozette

#adding configs
git clone https://github.com/MrExcaliburBr/voidrice
rm -rf voidrice/config/suckless/
mv voidrice/config/* .config
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#scripts
git clone https://github.com/MrExcaliburBr/scripts ~/code/scripts

#suckless stuff
mkdir ~/.config/suckless
mkdir .config/suckless/dwm
mkdir .config/suckless/st
mkdir .config/suckless/dmenu
git clone https://github.com/MrExcaliburBr/my-dwm
git clone https://github.com/MrExcaliburBr/my-st
git clone https://git.suckless.org/dmenu

cd .config/suckless/dwm
sudo make install
cd ~/.config/suckless/st
sudo make install
cd ~/.config/suckless/dmenu
sudo make install 

# sound
sudo cp void-post/asound.conf /etc/

#Enabling alsa, dbus, networkmanager and acpid 
sudo ln -s /etc/sv/alsa/ /var/service/
sudo ln -s /etc/sv/dbus/ /var/service/
sudo unlink /etc/sv/dhcpcd/
sudo ln -s /etc/sv/NetworkManager/ /var/service/


