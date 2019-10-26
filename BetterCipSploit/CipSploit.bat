set VipVersion=1.8
setlocal delayexpansion
title CipSploit hubฉ
cls
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
rem if exist s.dll ( del s.dll ) else ( goto updatecs1 )
rem :updatecs1
rem cd Downloads\XDevFolder
rem call ping.bat
rem if exist s.dll 
rem ( cd..
rem cd..
rem goto updatecs
rem )
rem else
rem (
rem cd..
rem cd..
rem echo you dot have net connection...... ;-;
rem echo pls buy a net subscription and then try again...........
rem pause >nul
rem exit

rem :updatecs
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
rem echo ษออออออออออออออออออออผ
rem Echo บ Found a new update บ
rem echo ศออออออออออออออออออออผ
rem :call CipUpdater.bat
rem echo calling CipUpdater.bat
rem pause >nul
rem )
cd Downloads/XDevFolder
for /f "delims=" %%x in (version.txt) do set ThisVersion=%%x
cd ..
cd ..

@echo off
cls
cd Downloads\XDevFolder
call color.cmd
cd..
cd..
goto agrchk

:agrchk
cd Downloads\XDevFolder
if exist agrd.dll (
cd..
cd..
goto cmd )
else 
(
goto agreement
)


:agreement
cls
color 0a
cd Downloads\XDevFolder
cls
type main.txt
cd..
cd..
echo.
echo.
echo pls type agree to continue
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
goto veri
) else (
cd..
cd.. 
goto color )





:color
cls
cd Downloads\XDevFolder
cls
type logo.txt
cd..
cd..
echo.
echo [1] for white mode.
echo [2] for dark mode.
echo.
set /p "input=color: "
if %input%==1 goto white if NOT goto setclr
if %input%==2 goto dark if NOT goto setclr


:white
color f5
cd Downloads\XDevFolder
echo set %cl% = f5 >> color.cmd
cd..
cd..
goto veri


:dark
color 0a
cd Downloads\XDevFolder
echo set %cl% = 0a >> color.cmd
cd..
cd..
goto veri












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
goto main
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
goto main
)

:VipMenu
cls
cd Downloads/XDevFolder
type Logo.txt
cd..
cd..
echo.
echo.
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
%run%
menu f40 "Premium Features" "Application/Program" "Game" "Browser Games" "Exit"
if %ERRORLEVEL% == 1 goto PremiumFeatures
if %ERRORLEVEL% == 2 goto VIPChooseApp
if %ERRORLEVEL% == 3 goto VIPChooseGame
if %ERRORLEVEL% == 4 goto VIPChooseBG
if %ERRORLEVEL% == 5 exit
goto VipMenu

pause >nul
goto VipMenu

:PremiumFeatures
cd Downloads\XDevFolder
call pkmn.bat
pause >nul
goto VipMenu

:main
cls
cd Downloads/XDevFolder
type Logo.txt
color = %clr%
cd ..
cd ..
echo.
echo Hello %USERNAME%, welcome back to CipSploit V%DownloadedVersion%!
echo VIP Member: %isVip%
echo.
echo.
echo.
echo.
echo Please Choose an option:
menu f40 "Activate CipSploit Premium" "Try CipSploit Premium" "Application/Program" "Game" "Browser Games" "Exit"
if %ERRORLEVEL% == 1 goto ActivateCS
if %ERRORLEVEL% == 2 goto CSPTrial
if %ERRORLEVEL% == 3 goto ChooseApp
if %ERRORLEVEL% == 4 goto ChooseGame
if %ERRORLEVEL% == 5 goto ChooseBG
if %ERRORLEVEL% == 6 exit
goto main

:CSPTrial
cls
title CipSploit Trial
echo %cd%
cd Downloads/XDevFolder
type Logo1.txt
cd ..
cd ..
for /f "tokens=1-4 delims=/-. " %%i in ('date /t') do (call :set_date %%i %%j %%k %%l)
goto :end_set_date

:set_date
if "%1:~0,1%" gtr "9" shift
for /f "skip=1 tokens=2-4 delims=(-)" %%m in ('echo,^|date') do (set %%m=%1&set %%n=%2&set %%o=%3)
goto :eof

:doc4
cd Downloads\XDevFolder
echo %USERNAME% agre6ed to cipsploit tos at %time% %date% >> agrd.dll
call log1.bat
cd..
cd..
goto cmd


:end_set_date
cls
set /a endday = %dd% + 4
echo.
echo.
echo =============================================================
echo WARNING! THE TRIAL WILL ONLY WORK UNTIL %endday%-%mm%-%yy%
echo =============================================================
pause



:ActivateCS
echo.
echo.
echo Please enter the activation code:
set /p "actvcode=> "
if NOT %actvcode%==%USERNAME% (
echo Invalid Code!
ping localhost -n 3 >nul
goto main
) else (
echo Code Valid!
cd Downloads/XDevfolder/
echo "H9UBUN73MCL" ; %USERNAME% ; %TIME% ; %DATE%>> actvsn.dll
cd ..
cd ..
echo Activated Premium!
ping localhost -n 5 >nul
goto VIPmenu
)


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
menu f870 "gorilla" "harambe" "7clicker" "kyprak" ".jar package of 5+ hacks" "back"
if %ERRORLEVEL% == 1 goto gorilla
if %ERRORLEVEL% == 2 goto harambe
if %ERRORLEVEL% == 3 goto 7clicker
if %ERRORLEVEL% == 4 goto kyprak
if %ERRORLEVEL% == 5 goto zip
if %ERRORLEVEL% == 6 goto


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

:zip
cls
echo Downloading ...
start https://github.com/juicylynx/minecrafthackszip
echo done!
ping localhost -n 3 >nul
goto check