sudo pacman -S pipewire --noconfirm
sudo pacman -S pipewire-pulse --noconfirm
sudo pacman -S pipewire-media-session --noconfirm
sudo pacman -S hyprpaper --noconfirm
sudo pacman -S wofi --noconfirm
sudo pacman -S neovim --noconfirm 
sudo pacman -S wl-clipboard --noconfirm
sudo pacman -S xdg-user-dirs --noconfirm
sudo pacman -S thunar --noconfirm
sudo pacman -S git --noconfirm
sudo pacman -S foot --noconfirm

xdg-user-dirs-update
xdg-mime default Thunar.desktop inode/directory
echo "/usr/bin/pipewire & /usr/bin/pipewire-pulse & usr/bin/pipewire-media-session" > ~/.xinitrc

mkdir -p ~/.local/share/fonts/ttf/GohuFont
 
cp ./GohuFont.ttf ~/.local/share/fonts/ttf/GohuFont
cp ./wallpaper.jpg ~/Pictures/wallpaper.jpg

sudo cp -T -f -r ./ly /etc/ly
cp -T -f -r ./wofi ~/.config/wofi
cp -T -f -r ./hypr ~/.config/hypr
cp -T -f -r ./nvim ~/.config/nvim
cp -T -f -r ./foot ~/.config/foot
cp -T -f -r ./HybridBar ~/.config/HybridBar

sudo pacman -R vim --noconfirm
sudo pacman -R nano --noconfirm
sudo pacman -R xdg-user-dirs --noconfirm
