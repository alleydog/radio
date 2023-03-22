@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO #EXTM3U> roks.ru.m3u
ECHO #EXTINF:-1,Радио Рокс>> roks.ru.m3u
CURL -sX GET https://roks.ru/player.php | FINDSTR "https://md5-icecast-radiorocks.cdnvideo.ru/roks.stream?md5=" > roks.tmp
FOR /F "USEBACKQ  DELIMS=" %%I IN (`FIND /N /V "" roks.tmp ^| FIND "[1]"`) DO (SET value=%%I)
DEL -Y roks.tmp
SET search=https
SET replace=http
SET modified=!value:%search%=%replace%!
SET /P STR=%modified:~15,100% >> roks.ru.m3u < NUL
ENDLOCAL