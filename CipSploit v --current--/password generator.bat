@echo off
cls
setlocal delayexpansion
cls
@mode con: cols=121 lines=32
cls
title Password Generator
:setclr
cls
goto color 
:color
echo.
echo ================================================ Trial Password Generator ===============================================
echo.
echo [1] for white mode.
echo [2] for dark mode.
echo.
set/p input= "color:"
if %input%==1 goto white if NOT goto setclr
if %input%==2 goto dark if NOT goto setclr
:white
color F5
:dark
cls
goto loop
:loop
cls
goto start
:start
echo.
echo =============================================== Trial Password Generator ===============================================
echo.
echo.
echo [1] Generating random password.
echo random password generated. press any key to continue.....
echo.
set/p input= ""
if %input%==1 goto 1 if NOT goto loop
:1
cls
echo =============================================== Trial Password Generator ===============================================
echo.
cd downloads/XDevFolder
if exist actcode.dll del actcode.dll
echo %random%%random% >> actcode.dll
echo your password is :-
type actcode.dll

pause > nul

echo.
echo.
echo [1] Go back to the beginning
echo [2] Exit.
echo.
set/p input= Choice:
if %input%==1 goto loop
if %input%==2 goto 2
:2
cls
Exit