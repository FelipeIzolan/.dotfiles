# INSTALL
sudo pacman -S pipewire pipewire-pulse pipewire-media-session --noconfirm
sudo pacman -S hyprpaper wofi --noconfirm
sudo pacman -S neovim wl-clipboard --noconfirm
sudo pacman -S xdg-user-dirs --noconfirm
sudo pacman -S nemo gvfs --noconfirm
sudo pacman -S ly --noconfirm
sudo pacman -S git --noconfirm

# UNINSTALL
sudo pacman -R vim --noconfigrm # neovim supremacy! 
sudo pacman -R nano --noconfirm # neovim supremacy!

sudo systemctl disable sddm.service
sudo pacman -R sddm --noconfirm

# CLEAR
sudo pacman -R $(pacman -Qdqt) --noconfirm
sudo pacman -Sc --noconfirm

# LOAD
### global
xdg-user-dirs-update
xdg-mime default nemo.desktop inode/directory
cp ./.xinitrc ~/.xinitrc

### neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp -r ./nvim ~/.config/nvim

### hybrid-bar
cp -r ./HybridBar ~/.config/HybridBar

### font
mkdir ~/.local/share/fonts
mkdir ~/.local/share/fonts/ttf
mkdir ~/.local/share/fonts/ttf/GohuFont
cp ./GohuFont.ttf ~/.local/share/fonts/ttf/GohuFont

### hyprland
cp ./wallpaper.jpg ~/Pictures/wallpaper.jpg
cp ./kitty.conf ~/.config/kitty/kitty.conf
cp ./hyprland.conf ~/.config/hypr/hyprland.conf
cp ./hyprpaper.conf ~/.config/hypr/hyprpaper.conf
cp -r ./wofi ~/.config/wofi

### display manager
sudo systemctl enable ly.service
sudo mkdir /etc/ly
sudo cp ./ly/config.ini /etc/ly/config.ini
