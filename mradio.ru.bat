@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO #EXTM3U> mradio.ru.m3u8
ECHO #EXTINF:-1,М-Радио>> mradio.ru.m3u8
CURL -sX GET http://mradio.ru/player.html > player.html
FOR /F "TOKENS=2,3" %%I IN ('FINDSTR /I "<audio.*></audio>" ^< player.html') DO @ECHO %%J > mradio.tmp
FOR /F "USEBACKQ DELIMS=" %%I IN (`FIND /N /V "" mradio.tmp ^| FIND "[1]"`) DO (SET value=%%I)
DEL -Y player.html mradio.tmp
SET search=_24
SET replace=_56
SET modified=!value:%search%=%replace%!
SET /P STR3=%modified:~7,92% >> mradio.ru.m3u8 < NUL
ENDLOCAL