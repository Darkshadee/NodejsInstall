#!/bin/sh

ins(){
    clear
if [ `whoami` != root ]; then
        echo -ne "\033[0;31mPlease run this scripts as root or using sudo\033[0m "
		echo ""
        exit
else    

     read -p "Past URL to Install : " url
        u=`echo $url | grep -o '\b\w*linux-x64\w*\b'`


        if  curl --output /dev/null --silent --head --fail "$url"; then
                
            if [ "$u" = linux-x64 ]
            then

                i=`echo $url | sed 's|.*/||'` 
                z=`echo $url | sed 's|.*tar.||'`
                # echo $i

                if [ "$z" = xz ]
                then

                    curl -o $i $url
                    tar -C /usr/local --strip-components 1 -xf $i
                    npm install -g npm@latest

                    NODE_VER=$(node -v)
                    NPM_VER=$(npm -v)

                    echo -ne " Nodejs" "\033[0;32m$NODE_VER\033[0m" "Installed Sucessfully"
                    echo -ne " Npm" "\033[0;32m$NPM_VER\033[0m" "Installed Sucessfully"

                elif [ "$z" = gz ] 
                then

                    curl -o $i $url
                    tar -C /usr/local --strip-components 1 -xzf $i 
                    npm install -g npm@latest
                    NODE_VER=$(node -v)
                    NPM_VER=$(npm -v)

                    echo -ne " Nodejs" "\033[0;32m$NODE_VER\033[0m" "Installed Sucessfully"
                    echo -ne " Npm" "\033[0;32m$NPM_VER\033[0m" "Installed Sucessfully"

                else
                    echo "Invalid Extantion"

                fi

            else
            echo ""
            echo -ne "\033[0;31mPlease Select Linux-x64 Package URL\033[0m " 
            echo ""
            exit;

            fi

        else
            echo ""
            printf '%s\n' "Invalid URL, Retry Again"
            echo ""
        fi

fi    
}    

ins
