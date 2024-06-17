sudo pacman -S hyprpaper --noconfirm
sudo pacman -S wofi --noconfirm
sudo pacman -S neovim --noconfirm 
sudo pacman -S wl-clipboard --noconfirm
sudo pacman -S xdg-user-dirs --noconfirm
sudo pacman -S nemo --noconfirm
sudo pacman -S git --noconfirm
sudo pacman -S foot --noconfirm

xdg-user-dirs-update
xdg-mime default Nemo.desktop inode/directory

mkdir -p ~/.local/share/fonts/ttf/GohuFont
 
cp ../GohuFont.ttf ~/.local/share/fonts/ttf/GohuFont
cp ../wallpaper.jpg ~/Pictures/wallpaper.jpg

sudo cp -T -f -r ./ly /etc/ly
cp -T -f -r ./wofi ~/.config/wofi
cp -T -f -r ./hypr ~/.config/hypr
cp -T -f -r ../nvim ~/.config/nvim
cp -T -f -r ./foot ~/.config/foot
cp -T -f -r ./HybridBar ~/.config/HybridBar

sudo pacman -R vim --noconfirm
sudo pacman -R nano --noconfirm
sudo pacman -R xdg-user-dirs --noconfirm
