@echo off
echo #EXTM3U > roks.ru.m3u
echo #EXTINF:-1,roks.ru >> roks.ru.m3u
curl -sX GET https://roks.ru/player.php | findstr "https://md5-icecast-radiorocks.cdnvideo.ru/roks.stream?md5=" > roks.tmp
for /f "usebackq  delims=" %%i in (`find /n /v "" roks.tmp ^| find "[1]"`) do (set value=%%i)
del -y roks.tmp
set /p str=%value:~15,100% >> roks.ru.m3u < nul
