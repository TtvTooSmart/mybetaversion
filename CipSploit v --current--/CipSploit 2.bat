@echo off

@mode con: cols=121 lines=32

    setlocal enableextensions enabledelayedexpansion
    cd Downloads/XDevFolder
    type logo.txt
    cd..
    cd..
    color 0c
cls 
@echo off

    
    set "CR=" & for /f %%a in ('copy /Z "%~f0" nul') do if not defined CR set "CR=%%a"
    
    set "fill=[###########]"

    
    echo( loading CipSploit


    for /l %%a in (2 7 11) do (

        set "spaces=!fill:~%%a!"

        <nul set/p ".= !fill:~0,%%a!!spaces:#= !!CR!"

        ping -n 2 "" >nul
    )
    echo done! 



set VipVersion=1.5
set version=4.8
cls
setlocal delayexpansion
cls

cls
title CipSploit hub©
:setclr
cls
goto color 


:color

color 0a
    cd Downloads/XDevFolder
    type logo.txt
    cd..
    cd..
echo [1] for white mode.
echo [2] for dark mode.
echo.
set/p input= "color:"
if %input%==1 goto white if NOT goto setclr
if %input%==2 goto dark if NOT goto setclr
:white
color F5
:dark


rem cd Downloads/XDevFolder
rem IF EXIST "version.txt" del "version.txt"
rem download "https://pastebin.com/raw/f0rFGadA" "version.txt"
rem for /f "delims=" %%x in (version.txt) do set DownloadedVersion=%%x
rem if %DownloadedVersion%==4.4 (
rem rem Version up to Date, press a key to continue...
rem pause >nul
rem cd ..
rem cd ..
rem ) else (
rem :call CipUpdater.bat
rem rem here you call CipUpdater.bat
rem pause >nul
rem )

:home 
cls

cd Downloads\XDevFolder
type logo.txt
cd..
cd..
echo ================================================ CipSploit© - exploit hub ===============================================
echo.

echo.
echo [1] Log In
echo [2] Exit
echo.
set /p op=
if %op%==1 goto 1
if %op%==2 goto 2
goto home

:1
color 07
cls
echo Cmd Accounts Log In
echo ================================
echo.
Set /p logname=Username:
if "%logname%"=="%logname%" goto 2.1
:2.1
echo.
set /p logpass="Password:"
if "%logpass%"=="%logpass%" goto login
:login
cd "%userprofile%\documents\logdet"
if exist "%logname%.bat" goto call
if not exist "%logname%.bat" goto errorlog
:call
call "%logname%.bat"
if "%password%"=="%logpass%" goto logdone
goto errorlog
:errorlog
color 0c
echo.
echo Username or Password incorrect.
echo Access denied.
pause >nul
goto home
:logdone
cls
echo Command Prompt
echo ==============
echo.
echo Successfully logged in!
echo.
goto verify





set RedAndGreen=00
set Blue=10
set DarkGreen=20
set LightBlue=30
set Red=40
set Purple=50
set Yellow=60
set White=70
set DarkGrey=80
set SolidBlue=90
set BlackAndBlue=01
set BlackAndGreen=02

cls

:verify
 cd Downloads/XDevFolder
 if exist data.dll (
 set "isVip=yes"
 goto VipMenu
 ) else (
 set "isVip=no"
 goto main
 ) 


:VipMenu
cls
cd Downloads/XDevFolder
type logo1.txt
cd..
cd..
echo.
echo.
echo Hello %USERNAME%, welcome back to Premium CipSploit V%VipVersion%!
echo.
echo.
echo VIP Member: %isVip%
echo.
echo.
echo.
echo.
echo Please Choose an option:
echo [1] Pokemon game
echo [2] Application/Program
echo [3] Game
echo [4] Browser Games
echo [5] Exit
set /p = ERRORLEVEL

if %ERRORLEVEL% == 1 goto PremiumFeatures
if %ERRORLEVEL% == 2 goto ChooseApp
if %ERRORLEVEL% == 3 goto ChooseGame
if %ERRORLEVEL% == 4 goto ChooseBG
if %ERRORLEVEL% == 5 exit
goto VipMenu



pause >nul
goto VipMenu

:PremiumFeatures
cd Downloads/XDevFolder
call pkmn.bat
goto main


:main
cls
cd Downloads\XDevFolder
type logo.txt
cd..
cd..
echo.
echo.
echo Hello %USERNAME%, welcome back to CipSploit V%version%!
echo VIP Member: %isVip%
echo.
echo.
echo.
echo.
echo Please Choose an option:
echo [1] Activate CipSploit Premium
echo [2] Try Premium for free
echo [3] Application/Program
echo [4] Game
echo [5] Browser Games
echo [6] Exit
set /p mainopt =
if %mainopt%==1 goto ActivateCS
if %mainopt%==2 goto trypremium
if %mainopt%==3 goto ChooseApp
if %mainopt%==4 goto ChooseGame
if %mainopt%==5 goto ChooseBG
if %mainopt%==6 exit
goto main

:ActivateCS
echo.
echo.
echo Please enter the activation code:
set /p "actvcode=> "
if NOT %actvcode%==H9UBUN73MCL (
echo Invalid Code!
ping localhost -n 3 >nul
goto main
) else (
echo Code Valid!
cd Downloads/XDevfolder/
echo "H9UBUN73MCL"  >> data.dll
echo %USERNAME% %TIME% %DATE% >> actvsn.dll
echo Activated Premium!
ping localhost -n 5 >nul
goto VIPmain
)

:trypremium
cls
cd Downloads/XDevFolder
type logo.txt
cd..
cd..
echo Do you want to use your free trial?
echo.
echo yes
echo no
set /p "fpuse=> "
if %fpuse%==1 goto usenow
if %fpuse%==2 goto main

:usenow
cls
cd Downloads\XDevFolder
if EXIST activatefp.dll 
( 
    echo you have already used your one time free premium 
    echo pay 10$ to developers to unlock premium.
    goto main 
)
    else
( 
goto doc
)



:doc
    cd "%userprofile%\documents"
    if EXIST Adobepremium goto doc2
     ) else (

    md Adobepremium goto doc2
    )


:doc2 
    cd "%userprofile%\documents\Adobepremium"
    echo one time free premium is availed by %USERNAME% >> Adobepremium.dll 
    goto doc3


:doc3 
    goto VipMenu2







:ChooseBG
cls
echo Please choose an app:
echo.
echo.
menu f870 "CoolMath Games" "Back"
if %ERRORLEVEL% == 1 goto CMGHack
if %ERRORLEVEL% == 2 goto main

:CMGHack
cls
echo Oppening browser...
start http://www.hackedonlinegames.com/games/browse/cool-math
echo Done!
ping localhost -n 3 >nul
goto main

:ChooseApp
cls
echo Please choose an app:
echo.
echo.
menu f870 "Archerio (Android)" "Unassigned" "Back"
if %ERRORLEVEL% == 1 goto Archerio
if %ERRORLEVEL% == 2 goto ChooseApp
if %ERRORLEVEL% == 3 goto main

:Archerio
cls
echo Oppening browser...
start https://gofile.io/?c=slT6Yn
echo Done!
ping localhost -n 3 >nul
goto main


:ChooseGame
cls
echo Please choose a game:
echo.
echo.
menu f870 "Roblox" "Minecraft" "back"
echo A
if %ERRORLEVEL% == 1 goto Roblox
if %ERRORLEVEL% == 2 goto Minecraft
if %ERRORLEVEL% == - goto main

:Roblox
cls
menu f870 "Topkek Script" "Trigon Executor" "XPloit Executor made by Cip 2.0" "back"
if %ERRORLEVEL% == 1 goto Topkek
if %ERRORLEVEL% == 2 goto TrigonExec
if %ERRORLEVEL% == 3 goto RBXPloit
if %ERRORLEVEL% == 4 goto back

:Topkek
cls
echo Downloading topkek...
download https://pastebin.com/3r8sNvt3 Topkek.lua
move /Y "Topkek.lua" "Downloads/Games/Roblox"
echo.
echo.
echo.
echo Press enter to continue
pause >nul
goto main



:Trigon
cls
echo Oppening browser...
start https://mega.nz/#F!o1lB3DaB!9zoxRYNYqOYVQghjn8b9nw
echo Done!
ping localhost -n 3 >nul
goto main

:RBXPloit
cls
if %isVip%==yes (
echo Oppening browser...
start https://mega.nz/#F!26wQBYJK!Xl22h1lDiTPJSjoc7w_ZQw
echo Done!
ping localhost -n 3 >nul
goto main
) else (
echo This is a premium only feature! 
ping localhost -n 3 >nul
goto main
)

:back
goto main

:Minecraft
cls
menu f870 "gorilla" "harambe" "7clicker" "kyprak" "back"
if %ERRORLEVEL% == 1 goto gorilla
if %ERRORLEVEL% == 2 goto harambe
if %ERRORLEVEL% == 3 goto 7clicker
if %ERRORLEVEL% == 4 goto kyprak
if %ERRORLEVEL% == 5 goto back

:gorilla
cls
echo Downloading gorilla...
start https://mega.nz/#!wyIEkb4Y!6e2J1Zx92JaI5rclSaepnF3xkMg3Sk9gbz-aoMPTrrw
echo Done!
ping localhost -n 3 >nul
goto main

:harambe
cls
echo Downloading harambe...
start https://mega.nz/#!lmZHjQQa!UM36pIMixBicq8_GsK_FXFc1KtCKXVSqPrwm9P8XmF4
echo Done!
ping localhost -n 3 >nul
goto main

:7clicker
cls
echo Downloading ...
start https://mega.nz/#!8u5zCDgL!ei0-vIYOZe6RZIotG4K4J1lTVlVI5G0KbLM9nZml_O4
echo Done!
ping localhost -n 3 >nul
goto main

:kyprak
cls
echo Downloading ...
start https://mega.nz/#!Em4XWKaL!l8HOQwPpK8tP-oI0F1ruiwHGvjaCt6SyzqkpFH6Mxlo
echo Done!
ping localhost -n 3 >nul
goto main

