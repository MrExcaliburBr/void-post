#! /bin/bash
#dependencies 
#xorg
#xrandr xorg-minimal xorg-fonts mesa-dri intel-video-accel linux-firmware-intel

#dwm and dmenu
#git scc (gcc se nao der certo) libXinerama-devel libXft-devel freetype-devel

#st
#libX11-devel ncurses-term 

#coisas que eu uso
#qutebrowser youtube-dl dunst sxhkd unclutter zsh cmus maim feh fzf nnn vim mpv font-cozette font-awesome font-awesome5 fontconfig setxkbmap picom task htop

#plugins
#oh-my-zsh VimPlug nnn.vim ( os plugins tao no .vimrc )
#nnn - getplugs; preview-tui; imgthumb
#10ff 

#discord
#so pega o tar.gz

#script
#dwm-bar fuzzyfinder quicksearch prompt kaomoji

##actual script
#getting stuff 

#creating necessary directories
mkdir ~/.local
mkdir ~/.local/share/
mkdir ~/.cache
mkdir ~/pix
mkdir ~/pix/scrot
mkdir ~/dl

#installing needed packages (or just what i use ;) )
sudo xbps-install -Sy xsetroot tree alsa-lib-devel NetworkManager alsa-utils dbus patch curl xrandr xorg-minimal xorg-fonts xf86-input-evdev xf86-input-synaptics xf86-video-fbdev xf86-video-intel mesa mesa-dri intel-video-accel gcc libXinerama-devel libXft-devel freetype-devel libX11-devel ncurses-term qutebrowser youtube-dl dunst sxhkd unclutter zsh cmus maim feh fzf ranger vim mpv fontconfig-devel setxkbmap picom task htop pulseaudio pulsemixer xbacklight slock w3m make pkg-config xf86-video-intel xf86-input-libinput font-cozette

#qutebrowser config
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/qutebrowser/config.py --create-dirs -o ~/.config/qutebrowser/config.py

#dunst config
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/dunst/dunstrc --create-dirs -o ~/.config/dunst/dunstrc

#sxhkd config
mkdir ~/.config/sxhkd
cat void-post/sxhkdrc >> ~/.config/sxhkd/sxhkdrc

#picom config
curl https://raw.githubusercontent.com/yshui/picom/next/picom.sample.conf --create-dirs -o ~/.config/picom/picom.conf

#file for kaomoji binding
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/kaomoji/kaomoji --create-dirs -o ~/.config/kaomoji

#zsh config
cat void-post/zshrc >> .zshrc

#VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Vim config
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.vimrc --create-dirs -o ~/.vimrc

vim +PlugInstall +qa

#scripts
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/dwm-bar.sh --create-dirs -o ~/code/scripts/dwm-bar.sh
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/quicksearch.sh -o ~/code/scripts/quicksearch.sh
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/prompt.sh -o ~/code/scripts/prompt.sh
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/fuzzyfinder.sh -o ~/code/scripts/fuzzyfinder.sh
curl https://raw.githubusercontent.com/bakkeby/flexipatch-finalizer/master/flexipatch-finalizer.sh -o ~/code/scripts/flexipatch-finalizer.sh
chmod +x ~/code/scripts/dwm-bar.sh
chmod +x ~/code/scripts/quicksearch.sh
chmod +x ~/code/scripts/prompt.sh
chmod +x ~/code/scripts/fuzzyfinder.sh
chmod +x ~/code/scripts/flexipatch-finalizer.sh 

# ~/ cleanup
mkdir ~/.local/share/task
touch ~/.local/share/taskrc
mkdir ~/.config/less
touch ~/.config/less/lesskey
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

#Changing xinitrc
sudo rm /etc/X11/xinit/xinitrc
sudo cat void-post/xinitrc >> /etc/X11/xinit/xinitrc

#Enabling alsa and networkmanager
sudo ln -s /etc/sv/alsa /var/service
sudo unlink /etc/sv/dhcpcd
sudo ln -s /etc/sv/NetworkManager /var/service

#for last: oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
