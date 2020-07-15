#!/bin/sh



ins(){
    clear
if [ `whoami` != root ]; then
        echo -ne "\033[0;31mPlease run this scripts as root or using sudo\033[0m "
		echo ""
        exit
else    

read -p "Past URL to Install : " pac

# Node="https://nodejs.org/dist/v12.18.2/node-v12.18.2-linux-x64.tar.xz"
i=`echo $pac | awk -F '/' '{print $6}'`
# echo $i
# curl -o $i $pac
tar -C /usr/local --strip-components 1 -xf $i
npm install -g npm@latest

NODE_VER=$(node -v)
NPM_VER=$(npm -v)

echo -ne " Nodejs" "\033[0;32m$NODE_VER\033[0m" "Installed Sucessfully"
echo -ne " Npm" "\033[0;32m$NPM_VER\033[0m" "Installed Sucessfully"

fi    
}    

ins

# 