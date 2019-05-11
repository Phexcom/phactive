# Phactive
```
This is a very basic script that runs nmap every day at 10AM using cronjon that Scans 0-65535 with
"-A -Pn -v -T4 -F -sV" Flags then uses ndiff to compare the result. 
If there's any difference it send a notification to your specified Telegram bot about
new ports discovered.
```

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/Phexcom/phactive/blob/master/LICENSE)

* [![Twitter Follow](https://img.shields.io/twitter/follow/phexcom.svg?style=social&label=Follow)](https://twitter.com/phexcom) Phexcom @phactive


### Download, setup, and usage


You must have [Nmap] and [Ndiff] Installed


`git clone https://github.com/Phexcom/phactive.git /opt/phactive`

`sudo nano /opt/phactive/main.sh`


* Add the host you want to scan and monitor

```
TARGETS="127.0.0.1"                  # Target eg: (Ex: scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.0-255.1-254)
```


* Add your telegram chat id and Token

```
chat_id="<Telegram chat id>" # Telegram Chat id
tg_token="<Telegram Bot Token" # Telegram bot Token
```

To setup a telegram  token and chat id [Check out this Post]


### Setup a cron job

* Once you done with the setup. You can run a cron job that runs every morning at 10am or your
desirable time. Here is an Example:

`sudo  nano /etc/crontab`

Then copy and paste then save

```00 10 * * *    root bash  /opt/phactive/main.sh```

[Nmap]: https://nmap.org/

[Ndiff]: https://nmap.org/ndiff/

[Check out this Post]: https://www.shellhacks.com/telegram-api-send-message-personal-notification-bot/