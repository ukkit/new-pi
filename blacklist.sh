#!/bin/bash
/usr/local/bin/pihole -b cloudconfig.googleapis.com 13 i.ytimg.com 4 youtube.com 4
sleep 5
/usr/local/bin/pihole --wild googlevideo.com 1 l.google.com 8 youtube.com 4
sleep 5
/usr/local/bin/pihole --wild spotify.com instagram.com
sleep 5
/usr/local/bin/pihole --wild discord.com discordap.net discord.gg
sleep 5
/usr/local/bin/pihole --wild ppy.sh
sleep 5
/usr/local/bin/pihole -g
sleep 60
/usr/local/bin/pihole restartdns
