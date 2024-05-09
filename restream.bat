@echo off
set SRC_URL=http://radio.ru/
set A=64k
set AC=2
set AR=48000
set RTMP_URL=rtmp://stream.ru/
set STREAM_KEY=0987654321:mnbvcxzlkjhgfdsapoiuytrewq
@start ffmpeg -hide_banner -i "%SRC_URL%" -c:a aac -b:a %A% -ac %AC% -ar %AR% -f flv "%RTMP_URL%%STREAM_KEY%"