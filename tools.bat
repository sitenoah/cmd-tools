@echo off
title CMD Tools
color 3

:MENU
echo.
echo Please select an option below.
echo.
echo 1) Execute the ipconfig command
echo 2) Open a Notepad window
echo 3) Start Firefox
echo 4) Generate a password (work in progress)
echo 5) Close this window
echo.
set /p m=Type 1, 2, 3, 4, or 5 then press ENTER: 
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
    echo 1) Firefox
    echo 2) Firefox Developer Edition
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
setlocal enabledelayedexpansion
set _rndlength=8
set _alphanumeric=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
set _str=%_alphanumeric%987654321
:_lenloop
if not "%_str:~18%"=="" set _str=%_str:~9%& set /a _len+=9& goto :_lenloop
set _tmp=%_str:~9,1%
set /a _len=_len+_tmp
set _count=0
set _rndalphanum=
:_loop
set /a _count+=1
set _rnd=%random%
set /a _rnd=_rnd%%%_len%
set _rndalphanum=!_rndalphanum!!_alphanumeric:~%_rnd%,1!
if !_count! lss %_rndlength% goto _loop
echo Your password is !_rndalphanum!
pause
goto :MENU

:se5
cls
echo https://github.com/sitenoah/cmd-tools/
pause
exit
