@echo off

@mode con: cols=122 lines=32
@echo off

    setlocal enableextensions disabledelayedexpansion

    for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f "loading resources"

    )
    for /l %%f in (100 -1 0) do (
        call :drawProgressBar %%f "decompliling dll files"

    )
    for /l %%f in (0 5 100) do (
        call :drawProgressBar !random! "extracting and instaling registry keys"  
)

    rem Clean all after use
    call :finalizeProgressBar 1


    call :initProgressBar "|" " "
    call :drawProgressBar 0 "finalizing......"
    for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f 
 )

    endlocal
    exit /b


:drawProgressBar value [text]
    if "%~1"=="" goto :eof
    if not defined pb.barArea call :initProgressBar
    setlocal enableextensions enabledelayedexpansion
    set /a "pb.value=%~1 %% 101", "pb.filled=pb.value*pb.barArea/100", "pb.dotted=pb.barArea-pb.filled", "pb.pct=1000+pb.value"
    set "pb.pct=%pb.pct:~-3%"
    if "%~2"=="" ( set "pb.text=" ) else ( 
        set "pb.text=%~2%pb.back%" 
        set "pb.text=!pb.text:~0,%pb.textArea%!"
    )
    <nul set /p "pb.prompt=[!pb.fill:~0,%pb.filled%!!pb.dots:~0,%pb.dotted%!][ %pb.pct% ] %pb.text%!pb.cr!"
    endlocal
    goto :eof

:initProgressBar [fillChar] [dotChar]
    if defined pb.cr call :finalizeProgressBar
    for /f %%a in ('copy "%~f0" nul /z') do set "pb.cr=%%a"
    if "%~1"=="" ( set "pb.fillChar=#" ) else ( set "pb.fillChar=%~1" )
    if "%~2"=="" ( set "pb.dotChar=." ) else ( set "pb.dotChar=%~2" )
    set "pb.console.columns="
    for /f "tokens=2 skip=4" %%f in ('mode con') do if not defined pb.console.columns set "pb.console.columns=%%f"
    set /a "pb.barArea=pb.console.columns/2-2", "pb.textArea=pb.barArea-9"
    set "pb.fill="
    setlocal enableextensions enabledelayedexpansion
    for /l %%p in (1 1 %pb.barArea%) do set "pb.fill=!pb.fill!%pb.fillChar%"
    set "pb.fill=!pb.fill:~0,%pb.barArea%!"
    set "pb.dots=!pb.fill:%pb.fillChar%=%pb.dotChar%!"
    set "pb.back=!pb.fill:~0,%pb.textArea%!
    set "pb.back=!pb.back:%pb.fillChar%= !"
    endlocal & set "pb.fill=%pb.fill%" & set "pb.dots=%pb.dots%" & set "pb.back=%pb.back%"
    goto :eof

:finalizeProgressBar [erase]
    if defined pb.cr (
        if not "%~1"=="" (
            setlocal enabledelayedexpansion
            set "pb.back="
            for /l %%p in (1 1 %pb.console.columns%) do set "pb.back=!pb.back! "
            <nul set /p "pb.prompt=!pb.cr!!pb.back:~1!!pb.cr!"
            endlocal
        )
    )
    for /f "tokens=1 delims==" %%v in ('set pb.') do set "%%v="

rem cd Downloads\XDevFolder
rem IF EXIST "version.txt" del "version.txt"
rem download "https://pastebin.com/raw/f0rFGadA" "version.txt"
rem for /f "delims=" %%x in (version.txt) do set DownloadedVersion=%%x
rem if %DownloadedVersion%==4.4 (
rem echo Version up to Date, press a key to continue...
rem pause >nul
rem cd ..
rem cd ..
rem ) else (
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
Echo º Found a new update º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
rem :call CipUpdater.bat
rem echo calling CipUpdater.bat
rem pause >nul
rem )
goto agrchk

:agrchk
cd Downloads\XDevFolder
if exist agree.dll (
cd..
cd..
goto cmd
) else (
goto agreement
)


:agreement
cls
color 0a
cd Downloads\XDevFolder
type main.txt
cd..
cd..
echo.
echo.
echo pls type agree to continu
set /p agr="type "
if %agr%==agree (
echo agreed!!!
goto doc4
) else (
echo not agreed perfectly
pause
)


:cmd
cd Downloads\XDevFolder
if exist color.cmd (
call color.cmd
cd..
cd..
) else (
cd..
cd.. 
goto setclr )

set VipVersion=1.9
set version=4.8
cls
setlocal delayexpansion
cls
@echo off
@mode con: cols=121 lines=32
cls
title CipSploit hub©


:setclr
cls
cd Downloads\XDevFolder
if exist color.cmd ( goto veri ) else ( goto color )

 
:color
cls
color 0a
cd Downloads\XDevFolder
type logo.txt
cd..
cd..
echo.
echo [1] for white mode.
echo [2] for dark mode.
echo.
set/p input= "color:"
if %input%==1 goto white if NOT goto setclr
if %input%==2 goto dark if NOT goto setclr
:white
color f5
cd Downloads\XDevFolder
echo color=0a >> color.cmd
cd..
cd..
goto veri


:dark
color 0a
cd Downloads\XDevFolder
echo color=0a >> color.cmd
cd..
cd..
goto veri

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
cd Downloads\XDevFolder
if exist data.dll (
set "isVip=yes"
cd ..
cd ..
goto VipMenu
) else (
set "isVip=no"
cd ..
cd ..
goto slt
)
:veri
cls
cd Downloads\XDevFolder
if exist data.dll (
set "isVip=yes"
cd ..
cd ..
goto VipMenu
) else (
set "isVip=no"
cd ..
cd ..
goto slt
)

:slt
cd %USERPROFILE%\Documents\Adobepremium
if NOT exist Adobepremium.dll (
cd ..
goto main
) else (
cd ..
goto main2
)


cls
cd Downloads\XDevFolder
if EXIST activatefp.dll (
set "isfp=yes"
cd ..
cd ..
goto VipMenu2
) else (
set "isfp=no"
cd ..
cd ..
goto main
)

:VipMenu
cls
cd Downloads\XDevFolder
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
echo.
menu f870 "Premium Features" "Android Game Hacks" "PC Game hacks" "Free browser games" "exit"
if %ERRORLEVEL%==1 goto PremiumFeatures
if %ERRORLEVEL%==2 goto ChooseApp
if %ERRORLEVEL%==3 goto ChooseGame
if %ERRORLEVEL%==4 goto ChooseBG
if %ERRORLEVEL%==5 exit
goto VipMenu

:VipMenu2
cls
cd Downloads\XDevFolder
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
echo.
menu f870 "Premium Features" "Android Game Hacks" "PC Game hacks" "Free browser games" "exit" 
if %ERRORLEVEL%==1 goto PremiumFeatures
if %ERRORLEVEL%==2 goto ChooseApp
if %ERRORLEVEL%==3 goto ChooseGame
if %ERRORLEVEL%==4 goto ChooseBG
if %ERRORLEVEL%==5 exit
goto VipMenu2


:PremiumFeatures
cd Downloads\XDevFolder
call pkmn.bat
goto Menu

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
echo. 
echo 1 - Activate premium. 
echo 2 - Try premium for free. 
echo 3 - Android Game Hacks. 
echo 4 - PC Game hacks. 
echo 5 - Free games
echo 6 - exit 
echo. 
menu f870 "Premium Features" "Android Game Hacks" "PC Game hacks" "Free browser games" "exit"
if %ERRORLEVEL%==1 goto ActivateCS
if %ERRORLEVEL%==2 goto trypremium
if %ERRORLEVEL%==3 goto ChooseApp
if %ERRORLEVEL%==4 goto ChooseGame
if %ERRORLEVEL%==5 goto ChooseBG
if %ERRORLEVEL%==6 exit
goto main

:main2
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
echo.
menu f870 "Activate Premium" "Android Game Hacks" "PC Game hacks" "Free browser games" "exit" 
if %ERRORLEVEL%==1 goto ActivateCS
if %ERRORLEVEL%==2 goto ChooseApp
if %ERRORLEVEL%==3 goto ChooseGame
if %ERRORLEVEL%==4 goto ChooseBG
if %ERRORLEVEL%==5 exit
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
cd Downloads\XDevFolder
echo "H9UBUN73MCL"  >> data.dll
echo %USERNAME% %TIME% %DATE% >> actvsn.dll
cd..
cd..
echo Activated Premium!
ping localhost -n 5 >nul
goto VipMenu
)

:trypremium
cls
cd Downloads\XDevFolder
type logo.txt
cd..
cd..
echo Do you want to use your free trial?
echo.
echo. 
echo 1 - yes.
echo 2 - no.
echo. 
menu f870 "Yes" "No"
if %ERRORLEVEL%==1 goto usenow
if %ERRORLEVEL%==2 goto main

:usenow
cls
cd %USERPROFILE%\Documents\Adobepremium
if EXIST Adobepremium.dll ( goto main ) else ( goto doc )



:doc
    cd "%userprofile%\documents"
    if EXIST Adobepremium ( goto doc2
     ) else (

    md Adobepremium goto doc2
    )


:doc2 
    cd "%userprofile%\documents\Adobepremium"
    echo one time free premium is availed by %USERNAME% >> Adobepremium.dll 
    goto doc3


:doc3 
    goto VipMenu2

:doc4
cd Downloads\XDevFolder
echo %USERNAME% agrred tto cipsploit tos at %time% %date% >> agrd.dll
cd..
cd..
goto cmd



:check
if %isVip%==yes ( goto Vipmenu ) else ( goto main )

:ChooseBG
cls
echo Please choose an app:
echo.
echo.
menu f870 "CoolMath Games" "Back"
if %ERRORLEVEL% == 1 goto CMGHack
if %ERRORLEVEL% == 2 goto check

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
if %ERRORLEVEL% == 3 goto check

:Archerio
cls
echo Oppening browser...
start https://gofile.io/?c=slT6Yn
echo Done!
ping localhost -n 3 >nul
goto check


:ChooseGame
cls
echo Please choose a game:
echo.
echo.
menu f870 "Roblox" "Minecraft" "back"
echo A
if %ERRORLEVEL% == 1 goto Roblox
if %ERRORLEVEL% == 2 goto Minecraft
if %ERRORLEVEL% == - goto check

:Roblox
cls
menu f870 "Topkek Script" "Trigon Executor" "XPloit Executor made by Cip 2.0" "back"
if %ERRORLEVEL% == 1 goto Topkek
if %ERRORLEVEL% == 2 goto TrigonExec
if %ERRORLEVEL% == 3 goto RBXPloit
if %ERRORLEVEL% == 4 goto check

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
goto check



:Trigon
cls
echo Oppening browser...
start https://mega.nz/#F!o1lB3DaB!9zoxRYNYqOYVQghjn8b9nw
echo Done!
ping localhost -n 3 >nul
goto check

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
goto check
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
if %ERRORLEVEL% == 5 goto check

:gorilla
cls
echo Downloading gorilla...
start https://mega.nz/#!wyIEkb4Y!6e2J1Zx92JaI5rclSaepnF3xkMg3Sk9gbz-aoMPTrrw
echo Done!
ping localhost -n 3 >nul
goto check

:harambe
cls
echo Downloading harambe...
start https://mega.nz/#!lmZHjQQa!UM36pIMixBicq8_GsK_FXFc1KtCKXVSqPrwm9P8XmF4
echo Done!
ping localhost -n 3 >nul
goto check

:7clicker
cls
echo Downloading ...
start https://mega.nz/#!8u5zCDgL!ei0-vIYOZe6RZIotG4K4J1lTVlVI5G0KbLM9nZml_O4
echo Done!
ping localhost -n 3 >nul
goto check

:kyprak
cls
echo Downloading ...
start https://mega.nz/#!Em4XWKaL!l8HOQwPpK8tP-oI0F1ruiwHGvjaCt6SyzqkpFH6Mxlo
echo Done!
ping localhost -n 3 >nul
goto check

