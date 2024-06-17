check_and_download() {
  if [ ! -f $1 ]; then
    wget -O $1 $2
  fi
}

_patch() {
  patch -l -i $1 $2
}

sudo pacman -S xdg-user-dirs-update --noconfirm
sudo pacman -S xsetroot --noconfirm
sudo pacman -S git, wget --noconfirm
sudo pacman -S neovim --noconfirm
sudo pacman -S xwallpaper --noconfirm
sudo pacman -S nemo --noconfirm
sudo pacman -S scrot xclip --noconfirm

sudo pacman -S xorg-server xorg-xinit --noconfirm
sudo pacman -S base-devel libx11 libxft libxinerama

xdg-user-dirs-update
xdg-mime default Nemo.desktop inode/directory

mkdir -p ~/.local/share/fonts/ttf/GohuFont
cp -rf ../GohuFont.ttf ~/.local/share/fonts/ttf/GohuFont
cp -rf ../wallpaper.jpg ~/wallpaper.jpg

cp -T -f -r ../nvim ~/.config/nvim

mkdir ~/suckless
mkdir ~/suckless/patch

check_and_download ~/suckless/patch/tilegap.diff https://dwm.suckless.org/patches/tilegap/dwm-tilegap-6.4.diff
git clone https://git.suckless.org/dwm ~/suckless/dwm
git clone https://git.suckless.org/dmenu ~/suckless/dmenu
git clone https://github.com/LukeSmithxyz/st.git ~/suckless/st
# git clone https://git.suckless.org/st ~/suckless/st

cp -rf ./dwm.h ~/suckless/dwm/config.h
cp -rf ./dmenu.h ~/suckless/dmenu/config.h
cp -rf ./st.h ~/suckless/st/config.h

(
  cd ~/suckless/dwm/;
  _patch ~/suckless/patch/tilegap.diff ~/suckless/dwm/dwm.c;
  sudo make clean install
)

(
  cd ~/suckless/st/; 
  sudo make clean install;
)

(
  cd ~/suckless/dmenu/;
  sudo make clean install
)

printf "while true; do xsetroot -name \" [ \$(whoami)][ \$(date)] \"; sleep 1s; done" > ~/statusbar.sh
printf "[[ -f ~/.bashrc ]] && . ~/.bashrc\nstartx" > ~/.bash_profile
printf "xwallpaper --center ~/wallpaper.jpg & setxkbmap br & ~/statusbar.sh & exec dwm" > ~/.xinitrc

chmod +x ~/statusbar.sh

sudo pacman -R wget xdg-user-dirs-update --noconfirm
