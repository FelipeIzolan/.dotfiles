sudo pacman -S xorg-xsetroot --noconfirm
sudo pacman -S git --noconfirm
sudo pacman -S neovim --noconfirm
sudo pacman -S xwallpaper --noconfirm
sudo pacman -S nemo --noconfirm
sudo pacman -S rofi --noconfirm
sudo pacman -S scrot xclip --noconfirm
sudo pacman -S picom --noconfirm

sudo pacman -S xorg-server xorg-xinit xorg-xwininfo --noconfirm
sudo pacman -S base-devel libx11 libxft libxinerama gd --noconfirm

sudo pacman -S xdg-user-dirs --noconfirm
xdg-user-dirs-update
sudo pacman -R xdg-user-dirs --noconfirm

## ------------------------------------------------------

apply_patch() {
  curl -q $2 | patch -d $1 -i -
}

## ------------------------------------------------------

mkdir -p ~/.local/share/fonts/ttf/JetBrainsMonoNerdFont

git clone https://git.suckless.org/dwm ./suckless/dwm
git clone https://github.com/siduck/st.git ./suckless/st

cp ./wallpaper.jpg ~/wallpaper.jpg
cp -rf ./nvim ~/.config/nvim
cp -rf ./picom ~/.config/picom
cp -rf ./rofi ~/.config/rofi

cp -rf ./JetBrainsMonoNerdFont.ttf ~/.local/share/fonts/ttf/JetBrainsMonoNerdFont
cp -rf ./suckless/dwm.h ./suckless/dwm/config.h
cp -rf ./suckless/st.h ./suckless/st/config.h

apply_patch ./suckless/dwm https://dwm.suckless.org/patches/tilegap/dwm-tilegap-6.4.diff

## ------------------------------------------------------

sudo make -C ./suckless/dwm clean install
sudo make -C ./suckless/st clean install

## ------------------------------------------------------

printf "while true; do xsetroot -name " 󱑁 $(date +"%H:%M%p") "; sleep 1s; done" > ~/statusbar.sh
printf "[[ -f ~/.bashrc ]] && . ~/.bashrc\nstartx" > ~/.bash_profile
printf "xwallpaper --center ~/wallpaper.jpg & setxkbmap br & picom -b & ~/statusbar.sh & exec dwm" > ~/.xinitrc

chmod +x ~/statusbar.sh
