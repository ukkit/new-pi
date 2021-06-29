# new-pi
- sudo apt-get update && sudo apt-get upgrade
- sudo rpi-update
- sudo reboot
- sudo rpi-eeprom-update -d -a
## setup ohmyzsh
- sudo apt-get install zsh
- sudo chsh -s $(which zsh)
- sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
- ZSH_THEME="bira"

## python to point to python3
- sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

## install zram
### Download the script and copy to /usr/bin/ folder
- sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/novaspirit/rpi_zram/master/zram.sh
### make file executable
- sudo chmod +x /usr/bin/zram.sh
### edit /etc/rc.local file to run script on boot
- sudo nano /etc/rc.local
### add line before exit 0
- /usr/bin/zram.sh &
### save and exit and reboot

- sudo apt-get install -y python3-pip
- 
