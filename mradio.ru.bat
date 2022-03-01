@echo off
curl -sX GET http://mradio.ru/player.html > player.html
for /f "tokens=2,3" %%I in ('findstr /i "<audio.*></audio>" ^< player.html') do @echo %%J > mradio.tmp
del -y player.html
for /f "usebackq  delims=" %%i in (`find /n /v "" mradio.tmp ^| find "[1]"`) do (set value=%%i)
del -y mradio.tmp
echo #EXTM3U > mradio.ru.m3u
echo #EXTINF:-1,mradio.ru >> mradio.ru.m3u
set /p str3=%value:~7,92% >> mradio.ru.m3u < nul