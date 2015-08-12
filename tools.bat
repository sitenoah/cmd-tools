@echo off
title CMD Tools
color 3

:MENU
echo.
echo Please select an option below.
echo.
echo 1 - Execute the ipconfig command
echo 2 - Open a Notepad window
echo 3 - Start Firefox
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
start %windir%\system32\notepad.exe
goto :MENU

:se3
cls
if exist %programfiles%\Mozilla Firefox\firefox.exe (
  set firefox=true
)
if exist %programfiles%\Firefox Developer Edition\firefox.exe (
  set firedev=true
)
if %firefox%=="true" (
  if %firedev%=="true" (
    echo Multiple instances of Firefox found.
    echo Which would you like to start?
    echo.
    echo 1 - Firefox
    echo 2 - Firefox Developer Edition
    echo.
    set /p m=Type 1 or 2 then press ENTER:
    if %M%==1 (start %programfiles%\Mozilla Firefox\firefox.exe)
    if %M%==2 (start %programfiles%\Firefox Developer Edition\firefox.exe)
  ) else (start %programfiles%\Mozilla Firefox\firefox.exe)
) else (
  if %firedev%=="true" (start %programfiles%\Firefox Developer Edition\firefox.exe)
)
goto :MENU

:se4
cls
echo Thanks for using our tools!
pause
exit
