# new-pi
- sudo apt-get update && sudo apt-get upgrade
- sudo rpi-update
- sudo reboot
- sudo rpi-eeprom-update -d -a
## setup ohmyzsh
- sudo apt-get install zsh
- sudo chsh -s $(which zsh)
- sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
- vi .zshrc
> change default theme to:
```
 ZSH_THEME="bira"
```

## Disable bluetooth
> sudo vi /boot/config.txt
```
# Disable Bluetooth
dtoverlay=disable-bt
```

> disable related services
```
sudo systemctl disable hciuart.service
sudo systemctl disable bluealsa.service
sudo systemctl disable bluetooth.service
```

## Update to latest python
### Download and update to latest OpenSSL
- wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz
- tar xvf openssl-1.1.1k.tar.gz
- cd openssl-1.1.1k
- ./config
- make
- sudo make install
> It can take upto 10 minutes for above command to complete<br>
> By default your manual install of openSSL will be in /usr/local/ssl. You can confirm this by checking the modify time of the ssl directory with ls -la /usr/local/ssl .
> 
### Download the latest Python file
- wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
- tar -zxvf Python-3.9.6.tgz
- cd Python-3.9.6
- vi Modules/Setup 
> UNCOMMENT following lines
```
SSL=/usr/local/ssl
 _ssl _ssl.c \
    -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \
    -L$(SSL)/lib -lssl -lcrypto
```
- ./configure --enable-optimizations
- sudo make altinstall
> It can take upto 10 minutes for above command to complete

## python to point to python3
- sudo update-alternatives --install /usr/bin/python python /usr/local/bin/python3.9 10

## install zram
### Download the script and copy to /usr/bin/ folder
- sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/novaspirit/rpi_zram/master/zram.sh
- sudo chmod +x /usr/bin/zram.sh
- sudo vi /etc/rc.local
> add line before exit 0
```
/usr/bin/zram.sh &
```
- save the file and reboot pi

## Commands for intalling internet-pi from geerlingguy
- sudo apt-get install -y python3-pip
- pip3 install ansible
- sudo reboot
- git clone https://github.com/geerlingguy/internet-pi.git
- cd internet-pi
- ansible-galaxy collection install -r requirements.yml
- cp example.inventory.ini inventory.ini
- cp example.config.yml config.yml
