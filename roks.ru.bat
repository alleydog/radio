@ECHO OFF
ECHO #EXTM3U > roks.ru.m3u
ECHO #EXTINF:-1,roks.ru >> roks.ru.m3u
CURL -sX GET https://roks.ru/player.php | FINDSTR "https://md5-icecast-radiorocks.cdnvideo.ru/roks.stream?md5=" > roks.tmp
FOR /F "USEBACKQ  DELIMS=" %%I IN (`FIND /N /V "" roks.tmp ^| FIND "[1]"`) DO (SET value=%%I)
SET /P STR=%value:~15,100% >> roks.ru.m3u < NUL
DEL -Y roks.tmp