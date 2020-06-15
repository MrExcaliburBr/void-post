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
sudo xbps-install curl xrandr xorg-minimal xorg-fonts mesa-dri intel-video-accel scc libXinerama-devel libXft-devel freetype-devel libX11-devel ncurses-term qutebrowser youtube-dl dunst sxhkd unclutter zsh cmus maim feh fzf nnn vim mpv font-cozette font-awesome font-awesome5 fontconfig setxkbmap picom task htop

curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/qutebrowser/config.py -o .config/qutebrowser/config.py

mkdir .config/dunst
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/dunst/dunstrc -o .config/dunst/dunstrc

mkdir .config/sxhkd
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/sxhkd/sxhkdrc -o .config/sxhkd/sxhkdrc

mkdir .config/picom
cat /etc/xdg/picom.conf >> .config/picom/picom.conf

curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.config/kaomoji/kaomoji -o .config/kaomoji

curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.zshrc -o .zshrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/.vimrc -o .vimrc

mkdir code
mkdir code/scripts
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/dwm-bar.sh -o dwm-bar.sh
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/quicksearch.sh -o quicksearch.sh
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/prompt.sh -o prompt.sh
curl https://raw.githubusercontent.com/MrExcaliburBr/My-Dotfiles/master/code/scripts/fuzzyfinder.sh -o fuzzyfinder.sh
chmod +x code/scripts/dwm-bar.sh
chmod +x code/scripts/quicksearch.sh
chmod +x code/scripts/prompt.sh
chmod +x code/scripts/fuzzyfinder.sh

mkdir .local/share/task
touch .local/share/taskrc
mkdir .config/less
touch .config/less/lesskey
mkdir .local/share/zsh/
touch .local/share/zsh/history

mkdir .config/suckless
cd .config/suckless
git clone https://github.com/bakkeby/dwm-flexipatch
git clone https://github.com/bakkeby/st-flexipatch
git clone https://git.suckless.org/dmenu

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
