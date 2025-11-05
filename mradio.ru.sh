#!/bin/bash
echo "#EXTM3U" > mradio.ru.m3u
echo "#EXTINF:-1,mradio.ru, 64 kbps" >> mradio.ru.m3u
curl -sX GET http://mradio.ru/player.html | grep -F '&' | grep 'kbps64' | sed -e 's/<input id="kbps64" type="radio" name="kbps" value="//g' | sed -e 's/">//g' | sed -e 's/ //g' >> mradio.ru.m3u
echo "#EXTINF:-1,mradio.ru, 28 kbps" >> mradio.ru.m3u
curl -sX GET http://mradio.ru/player.html | grep -F '&' | grep 'kbps28' | sed -e 's/<input id="kbps28" type="radio" name="kbps" checked="checked" value="//g'  | sed -e 's/">//g' | sed -e 's/ //g' >> mradio.ru.m3u
