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

#installing needed packages (or just what i use ;) )
sudo xbps-install -Sy gnupg pass passmenu ueberzug tlp ffmpeg sox alsa-tools xdg-utils font-awesome5 xclip tmux zathura zathura-pdf-poppler acpid newsboat xsetroot tree alsa-lib-devel NetworkManager alsa-utils dbus patch curl xrandr xorg-minimal xorg-fonts xf86-input-evdev xf86-input-synaptics xf86-video-fbdev xf86-video-intel mesa mesa-dri intel-video-accel gcc libXinerama-devel libXft-devel freetype-devel libX11-devel ncurses-term qutebrowser youtube-dl dunst sxhkd unclutter zsh cmus maim feh fzf ranger vim-x11 mpv fontconfig-devel setxkbmap picom task htop xbacklight slock make pkg-config xf86-video-intel xf86-input-libinput font-cozette


git clone https://github.com/MrExcaliburBr/voidrice
rm -rf voidrice/config/suckless/
mv voidrice/config/* .config
mv voidrice/vimrc .vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall' -c '<\CR>' -c 'qa'
mv voidrice/zshrc .
mv zshrc .zshrc
sudo rm /etc/X11/xinit/xinitrc
sudo cp voidrice/xinitrc /etc/X11/xinit/xinitrc


#qutebrowser config
#curl https://raw.githubusercontent.com/MrExcaliburBr/voidrice/master/.config/qutebrowser/config.py --create-dirs -o ~/.config/qutebrowser/config.py

#dunst config
#curl https://raw.githubusercontent.com/MrExcaliburBr/voidrice/master/.config/dunst/dunstrc --create-dirs -o ~/.config/dunst/dunstrc

#sxhkd config
#mkdir ~/.config/sxhkd
#cat void-post/sxhkdrc >> ~/.config/sxhkd/sxhkdrc

#picom config
#curl https://raw.githubusercontent.com/MrExcaliburBr/voidrice/master/config/picom/picom conf --create-dirs -o ~/.config/picom/picom.conf

#file for kaomoji binding
#curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/kaomoji/kaomoji --create-dirs -o ~/.config/kaomoji/kaomoji

#VimPlug
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Vim config
#curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.vimrc --create-dirs -o ~/.vim/vimrc

#vim +PlugInstall +qa

#Newsboat config
#curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.newsboat/config --create-dirs -o ~/.newsboat/config
#curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.newsboat/urls -o ~/.newsboat/urls

#zathura config
#curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/zathura/zathurarc --create-dirs -o ~/.config/zathura/zathurarc

#tmux config
#mkdir .config/tmux
#cp void-post/tmux.conf .config/tmux/
#mkdir .tmux
#mkdir .tmux/plugins
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#zsh config
#cp void-post/zshrc .
#mv zshrc .zshrc

#scripts
cd ~/code
git clone https://github.com/MrExcaliburBr/scripts
chmod +x scripts/dwm-bar.sh
chmod +x scripts/quicksearch.sh
chmod +x scripts/prompt.sh
chmod +x scripts/fuzzyfinder.sh
chmod +x scripts/flexipatch-finalizer.sh 
cd ~

# ~/ cleanup
mkdir ~/.local/share/task
touch ~/.local/share/taskrc
mkdir ~/.config/less
touch ~/.config/less/lesskey
mkdir ~/.config/readline
touch ~/.config/readline/inputrc
mkdir ~/.local/share/zsh/
touch ~/.local/share/zsh/history

#suckless stuff
mkdir ~/.config/suckless
cd ~/.config/suckless
git clone https://github.com/bakkeby/dwm-flexipatch
git clone https://github.com/bakkeby/st-flexipatch
git clone https://git.suckless.org/dmenu

#compiling and finalizing suckless stuff 
rm dwm-flexipatch/patches.def.h
touch dwm-flexipatch/patches.def.h
cat ~/void-post/dwm-patches >> dwm-flexipatch/patches.def.h
cd dwm-flexipatch
sudo make install 
cd ..

rm st-flexipatch/patches.def.h
touch st-flexipatch/patches.def.h
cat ~/void-post/st-patches >> st-flexipatch/patches.def.h
cd st-flexipatch
sudo make install
cd ~

./code/scripts/flexipatch-finalizer.sh -r -d .config/suckless/dwm-flexipatch -o .config/suckless/dwm
./code/scripts/flexipatch-finalizer.sh -r -d .config/suckless/st-flexipatch -o .config/suckless/st
mv void-post/dwm-diff.diff .config/suckless/dwm
mv void-post/st-diff.diff .config/suckless/st
mv void-post/dmenu-diff.diff .config/suckless/dmenu
cd .config/suckless/dwm
patch < dwm-diff.diff
rm dwm-diff.diff
sudo make install 
cd ..

cd st
patch < st-diff.diff
rm st-diff.diff
sudo make install 
cd ..

cd dmenu
patch < dmenu-diff.diff
sudo make install
cd ..
rm -rf dwm-flexipatch st-flexipatch
cd ~

# sound
sudo cp void-post/asound.conf /etc/

#Enabling alsa, dbus, networkmanager and acpid 
sudo ln -s /etc/sv/alsa/ /var/service/
sudo ln -s /etc/sv/dbus/ /var/service/
sudo unlink /etc/sv/dhcpcd/
sudo ln -s /etc/sv/NetworkManager/ /var/service/

#for last: setting zsh as default shell 
curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
ZSH="$HOME/.config/oh-my-zsh" sh install.sh --unattended --keep-zshrc
cd .config/oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/softmoth/zsh-vim-mode
