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
sudo xbps-install -Sy voidr-repo-nonfree openssh rtl8822bu-dkms flatpak gnupg pass passmenu ueberzug tlp ffmpeg sox alsa-tools xdg-utils font-awesome5 xclip tmux zathura zathura-pdf-poppler acpid newsboat xsetroot tree alsa-lib-devel NetworkManager alsa-utils dbus patch curl xrandr xorg-minimal xorg-fonts xf86-input-evdev xf86-input-synaptics xf86-video-fbdev xf86-video-intel mesa mesa-dri intel-video-accel gcc libXinerama-devel libXft-devel freetype-devel libX11-devel ncurses-term qutebrowser youtube-dl dunst sxhkd unclutter zsh cmus maim feh fzf ranger neovim mpv fontconfig-devel setxkbmap picom task htop xbacklight slock make pkg-config xf86-video-intel xf86-input-libinput font-cozette straw-viewer

#flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#adding configs
git clone https://github.com/MrExcaliburBr/voidrice
mv voidrice/config/ssh voidrice/config/.ssh
mv voidrice/config/* .config

#vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#tmux plugin
mkdir .config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/

#scripts
git clone https://github.com/MrExcaliburBr/scripts ~/code/scripts

#suckless stuff
mkdir ~/.config/suckless
cd ~/.config/suckless
git clone https://github.com/MrExcaliburBr/my-dwm
git clone https://github.com/MrExcaliburBr/my-st
git clone https://git.suckless.org/dmenu

cd .config/suckless/my-dwm
sudo make install
cd ~/.config/suckless/my-st
sudo make install
cd ~/.config/suckless/dmenu
sudo make install 
cd ~

# sound
mv voidrice/asoundrc .asoundrc
cp voidrice/.asoundrc .
sudo cp voidrice/xinitrc /etc/X11/xinit/

#Enabling alsa, dbus, networkmanager and acpid 
sudo ln -s /etc/sv/alsa/ /var/service/
sudo ln -s /etc/sv/dbus/ /var/service/
sudo unlink /etc/sv/dhcpcd/
sudo ln -s /etc/sv/NetworkManager/ /var/service/

