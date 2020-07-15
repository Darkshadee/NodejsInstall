#!/bin/sh

ins(){
    clear
if [ `whoami` != root ]; then
        echo -ne "\033[0;31mPlease run this scripts as root or using sudo\033[0m "
		echo ""
        exit
else    

    read -p "Past URL to Install : " url

    if  curl --output /dev/null --silent --head --fail "$url"; then
    
        i=`echo $url | awk -F '/' '{print $6}'`
        curl -o $i $url
        tar -C /usr/local --strip-components 1 -xf $i
        npm install -g npm@latest

        NODE_VER=$(node -v)
        NPM_VER=$(npm -v)

        echo -ne " Nodejs" "\033[0;32m$NODE_VER\033[0m" "Installed Sucessfully"
        echo -ne " Npm" "\033[0;32m$NPM_VER\033[0m" "Installed Sucessfully"

    else
        echo ""
        echo -ne "\033[0;31mInvalid URL, Retry Again\033[0m"
        echo ""
    fi 

fi    
}    

ins
