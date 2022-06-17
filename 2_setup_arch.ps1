$BasePath = $env:USERPROFILE + "\wsl"
$Username = "cirale"

Set-Location $BasePath\Arch\

.\Arch.exe run sed -i'.bak' -e 's/^Server/#Server/g' -e 's!#Server = \(https\?://.*\?\.jp\)!Server = \1!g' /etc/pacman.d/mirrorlist

.\Arch.exe run pacman-key --init
.\Arch.exe run pacman-key --populate
.\Arch.exe run pacman -Syy --noconfirm archlinux-keyring

.\Arch.exe run sh -c "useradd -md /home/$Username $Username"
.\Arch.exe run sh -c "echo $Username ALL=NOPASSWD: ALL                    > /etc/sudoers.d/$Username"
.\Arch.exe run sh -c "echo Defaults:%$Username !requiretty               >> /etc/sudoers.d/$Username"
.\Arch.exe run sh -c "echo Defaults:%$Username env_keep += SSH_AUTH_SOCK >> /etc/sudoers.d/$Username"
.\Arch.exe run sh -c "chmod 440 /etc/sudoers.d/$Username"
.\Arch.exe run sh -c "passwd $Username"
.\Arch.exe run sh -c "passwd -l root"

.\Arch.exe config --default-user $Username

wsl --shutdown