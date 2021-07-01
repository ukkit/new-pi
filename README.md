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

## Update to latest python
### Download and update to latest OpenSSL
- wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz
- tar xvf openssl-1.1.1k.tar.gz
- cd openssl-1.1.1k
- ./config
- make
- sudo make install
> It can take upto 10 minutes for above command to complete
### Download the latest Python file
- wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
- tar -zxvf Python-3.9.6.tgz
- cd Python-3.9.6
- vi Models/Setup 
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
### make file executable
- sudo chmod +x /usr/bin/zram.sh
### edit /etc/rc.local file to run script on boot
- sudo nano /etc/rc.local
### add line before exit 0
- /usr/bin/zram.sh &
### save and exit and reboot

## Commands for intalling internet-pi from geerlingguy
- sudo apt-get install -y python3-pip
- pip3 install ansible
- sudo reboot
- git clone https://github.com/geerlingguy/internet-pi.git
- cd internet-pi
- ansible-galaxy collection install -r requirements.yml
- cp example.inventory.ini inventory.ini
- cp example.config.yml config.yml
