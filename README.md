# Phactive
This is a very basic script that runs nmap every day at 10AM Scanning 0-65535 with "-A -Pn -v -T4 -F -sV" Flags then uses ndiff to compare the result. If there's a difference it send a notification to your specified Telegram bot about new ports discovered.
