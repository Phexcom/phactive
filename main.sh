#!/usr/bin/env bash

TARGETS="127.0.0.1"                  # Target eg: (Ex: scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.0-255.1-254)
PORT="-p-"                           #Ports Default to scan 0-65535
OPTIONS="-A -Pn -v -T4 -F -sV"       #Nmap Flags

today=$(date +%Y-%m-%d)
yesterday=$(date -d yesterday +%Y-%m-%d)

chat_id="<Telegram chat id>" # Telegram Chat id
tg_token="<Telegram Bot Token" # Telegram bot Token

diff_directory='/opt/phactive/nmap_diff'

mkdir -p ${diff_directory}

nmap ${OPTIONS} ${TARGETS} -oA ${diff_directory}/scan_${today} > /dev/null 2>&1


telegram(){
    curl -F chat_id=${chat_id}  -F document=@${diff_directory}'/diff_'"$today"'.txt'  -F caption='Port changes detected -> (New opened port found!)'\
     -H 'Content-Type:multipart/form-data' \
    'https://api.telegram.org/bot'"$tg_token"'/sendDocument'

}
#
if [ -e ${diff_directory}/scan_${yesterday}.xml ]; then
    ndiff ${diff_directory}/scan_${yesterday}.xml ${diff_directory}/scan_${today}.xml > ${diff_directory}/diff_${today}.txt
fi

telegram



