#!/bin/bash
echo "#EXTM3U" > ~/Music/mradio.ru.m3u
echo "#EXTINF:-1,mradio.ru" >> ~/Music/mradio.ru.m3u
echo $(curl -sX GET http://mradio.ru/player.html | grep '<input id="kbps64" type="radio" name="kbps" value="http://stream2.loveradio.ru:80/16_mradio_56?type=.aac' | awk -F\" '{ print $8 }') >> ~/Music/mradio.ru.m3u
mpv ~/Music/mradio.ru.m3u
