@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO #EXTM3U> mradio.ru.m3u
ECHO #EXTINF:-1,М-Радио, 64 kbps>> mradio.ru.m3u
CURL -sX GET http://mradio.ru/player.html > player.html
FOR /F "TOKENS=2,3" %%I IN ('FINDSTR /I "<audio.*></audio>" ^< player.html') DO @ECHO %%J > mradio.tmp
FOR /F "USEBACKQ DELIMS=" %%I IN (`FIND /N /V "" mradio.tmp ^| FIND "[1]"`) DO (SET source=%%I)
SET search=_24
SET replace=_56
SET value=!source:%search%=%replace%!
SET /P STR3=%value:~7,92% >> mradio.ru.m3u < NUL
DEL -Y player.html mradio.tmp
ECHO.>> mradio.ru.m3u
ECHO #EXTINF:-1,М-Радио, 28 kbps>> mradio.ru.m3u
SET /P STR3=%source:~7,92% >> mradio.ru.m3u < NUL
ENDLOCAL