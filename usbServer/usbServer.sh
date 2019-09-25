
### 在u盘安装了命令行的linux版本后的一些 配置

change sources.list{}


change terminal font size{

    1:sudo dpkg-reconfigure console-setup,
    2:terminusbold 11*28
}

change terminal output color{

    1:user bashrc  change bashrc PS1 and LC_COLORS
}

install vim vim -gnome{}


change vimrc{
    1:use vimrc file
}

chinese character{

    1:sudo apt-get install fbterm,
    2:sudo adduser username video,  
    3:sudo chmod u+s /usr/bin/fbterm,

    4 in .bashrc maybe not use{
    
        #alias fbterm='LANG=zh_CN.UTF-8 fbterm'
        #if [[ "$TERM" = linux ]] && [[ "$(ps otty= $$)" =~ tty ]] && type fbterm &>/dev/null; then
            fbterm
        #fi
    },
    
    5:input method{

        sudo apt install fcitx fcitx-sunpinyin fcitx-frontend-fbterm

        in .fbtermrc 

        input-method=fcitx-fbterm
        encoding=utf8
    }

    6:change chinese font{ 

        sudo apt install ttf-wqy-zenhei
        font-name=mona,zenhei 
    }

}

install docker{

    1:sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

    2:curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    3:sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    4:sudo apt-get update

    5:sudo apt-get install -y docker-ce

    6:systemctl status docker

    7:sudo service docker restart
}

install docker-compose{

    1:sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    2:sudo chmod +x /usr/local/bin/docker-compose

    3:docker-compose --version

    4:docker-compose build
}

docker replace repository {
    
    1:sudo vi /etc/docker/daemon.json,
    2:{"registry-mirrors": ["https://registry.docker-cn.com"]}
}


install vim-gnome in docker{}


Enalble Wifi {

    1:{ 1:apt-get install rfkill //check wifi status
        2:rfkill list //list device
        3:rfkill unblock wifi 
    },
    2:{ 1:sudo systemctl stop NetworkManager //close networkmanager for wpa_supplicant in DesktopVersion
        2:sudo systemctl disable NetworkManager //not run in startup,
        3:sudo apy-get install wireless-tools #install iw,
        4:iwconfig  //find wifi interface name wlan0 wlps30
        5:sudo ip link set wlan0 up // open wifi card
        6:sudo iwlist wlan0 scanning | grep wifi network name
    }
    3:{
        1:sudo apt-get install wapsupplicant //install wp_supplicant
        2:sudo wpa_passphrase wifiname password | sudo tee /etc/wpa_supplicant.conf //touch conf file 
        3:sudo wpa_supplicant -c  /etc/wpa_supplicant.conf -i wlan0   //connect wifi
        4:iwconfig //check if connected
        5:sudo dhclient wlan0 //obtain private IP to access internet
        6:ifconfig wlan0 //check ip
        7:sudo dhclient wlan0 -r //release ip
    }
}

install vim plug{
    
    1:curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    2:{call plug#begin('~/.vim/plugged')

        Plug 'junegunn/vim-easy-align'
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
        "YCM
        Plug 'Valloric/YouCompleteMe'

        call plug#end()
    },      
    3:sudo apt install build-essential cmake python3-dev,
    4:cd ~/.vim/plugged/YouCompleteMe,
    5:python3 install.py ---go-completer --ts-completer --java-completer  --clangd-completer
}

js tutorial{
    1:https://github.com/verekia/js-stack-from-scratch.git
}

