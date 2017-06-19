@echo off
%~d1
cd %~p1

:again
if "%~n1" == "" goto done
if "%~x1" == ".png" goto processimage
if "%~x1" == ".jpg" goto processimage
if "%~x1" == ".JPG" goto processimage

:increment
shift
goto again

:done
pause
exit

:processimage
convert "%~n1%~x1" -resize 48x48 -gravity center -background transparent -extent 48x48! "mipmap-mdpi/ic_launcher.png"
convert "%~n1%~x1" -resize 72x72 -gravity center -background transparent -extent 72x72! "mipmap-hdpi/ic_launcher.png"
convert "%~n1%~x1" -resize 96x96 -gravity center -background transparent -extent 96x96! "mipmap-xhdpi/ic_launcher.png"
convert "%~n1%~x1" -resize 144x144 -gravity center -background transparent -extent 144x144! "mipmap-xxhdpi/ic_launcher.png"
convert "%~n1%~x1" -resize 192x192 -gravity center -background transparent -extent 192x192! "mipmap-xxxhdpi/ic_launcher.png"
rem goto increment
goto done