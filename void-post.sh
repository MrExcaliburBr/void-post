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
mkdir ~/.cache
mkdir ~/pix
mkdir ~/pix/scrot
mkdir ~/dl

#installing needed packages (or just what i use ;) )
sudo xbps-install -Sy curl xrandr xorg-minimal xorg-fonts mesa-dri intel-video-accel scc libXinerama-devel libXft-devel freetype-devel libX11-devel ncurses-term qutebrowser youtube-dl dunst sxhkd unclutter zsh cmus maim feh fzf nnn vim mpv fontconfig setxkbmap picom task htop pulseaudio pulsemixer xbacklight

#qutebrowser config
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/qutebrowser/config.py --create-dirs -o ~/.config/qutebrowser/config.py

#dunst config
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/dunst/dunstrc --create-dirs -o ~/.config/dunst/dunstrc

#sxhkd config
mkdir ~/.config/sxhkd
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/sxhkd/sxhkdrc --create-dirs -o ~/.config/sxhkd/sxhkdrc

#picom config
mkdir ~/.config/picom
cat /etc/xdg/picom.conf >> ~/.config/picom/picom.conf

#file for kaomoji binding
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/kaomoji/kaomoji --create-dirs -o ~/.config/kaomoji

#zsh config
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.zshrc --create-dirs -o ~/.zshrc

#VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qa

#Vim config
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.vimrc --create-dirs -o ~/.vimrc

#scripts
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/dwm-bar.sh --create-dirs -o ~/code/scripts/dwm-bar.sh
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/quicksearch.sh -o ~/code/scripts/quicksearch.sh
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/prompt.sh -o ~/code/scripts/prompt.sh
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/fuzzyfinder.sh -o ~/code/scripts/fuzzyfinder.sh
chmod +x ~/code/scripts/dwm-bar.sh
chmod +x ~/code/scripts/quicksearch.sh
chmod +x ~/code/scripts/prompt.sh
chmod +x ~/code/scripts/fuzzyfinder.sh

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

#for last: oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
