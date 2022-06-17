$BasePath = $env:USERPROFILE + "\wsl"

Set-Location $BasePath\Arch\
./Arch.exe run sudo pacman -Syyuu
#./Arch.exe run sudo pacman -R fakeroot-tcp
#./Arch.exe run sudo pacman --noconfirm -S fakeroot
./Arch.exe run sudo pacman -S --needed git base-devel
./Arch.exe run git clone https://aur.archlinux.org/yay.git ~/yay
./Arch.exe run cd yay-bin && makepkg -si

./Arch.exe run sudo pacman --noconfirm -S openssh zsh emacs

./Arch.exe run chsh -s /bin/zsh

./Arch.exe run git clone git@github.com:cirale/.dotfiles ~/.dotfiles
./Arch.exe run ln -s ~/.dotfiles/.zshrc ~/.zshrc
./Arch.exe run ln -s ~/.dotfiles/.emacs.d ~/.emacs.d
