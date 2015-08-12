@echo off
title CMD Tools
color 3

:MENU
echo.
echo PRESS 1, 2 OR 3 to select your task, or 4 to close this window.
echo.
echo 1 - Execute the ipconfig command
echo 2 - Open a Notepad window
echo 3 - Open a Firefox window
echo 4 - Close this window
echo.
set /p m=Type 1, 2, 3, or 4 then press ENTER: 
if %M%==1 goto se1
if %M%==2 goto se2
if %M%==3 goto se3
if %M%==4 goto se4

:se1
cls
ipconfig
goto :MENU

:se2
cls
cd %windir%\system32\
start notepad.exe
goto :MENU

:se3
cls
cd %programfiles%\Mozilla Firefox
start firefox.exe
goto :MENU

:se4
cls
echo Thanks for using our tools!
pause
exit
