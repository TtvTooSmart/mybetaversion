@echo off
title Zask's password encrypted batch file
color 0a

echo ษออออออออออออออออออออออออออออออออออออออป
echo บ Zask's password encrypted batch file บ
echo ศออออออออออออออออออออออออออออออออออออออผ
echo.

if not exist "C:\Pswrd.Zask\" (
  mkdir "C:\Pswrd.Zask\"
    if "!errorlevel!" EQU "0" (
      goto DirectoryExist
    ) else (
   echo Created the folder "C:\Pswrd.Zask" & timeout /t 5 /nobreak
  )
) else (
      goto DirectoryExist
)

:DirectoryExist

if exist C:\Pswrd.Zask\Key.Zask (
    goto UsernameExist
) else (
    goto CreatePasswordScreen
)


:UsernameExist

 for /f "Delims=" %%A in (C:\Pswrd.Zask\Password.Zask) do (
      set CHECKPASSWORD=%%A
 )
    for /f "Delims=" %%B in (C:\Pswrd.Zask\Key.Zask) do (
      set CHECKKEY=%%B
)

goto PasswordScreen

:CreatePasswordScreen
cls
echo Create a password.
echo.

setlocal EnableDelayedExpansion

set /p "CREATEPASSWORD= Enter password : "
set /p "CREATEKEY= Enter a key number (Choose a number 2-200) : "

set CHAR=0123456789azbycxdwevfugthsirjqkplomn

for /l %%C in (10 1 36) do (

for /f %%D in ("!CHAR:~%%C,1!") do (

set /a MATH=%%C*%CREATEKEY%
for /f %%E in ("!MATH!") do (

set "CREATEPASSWORD=!CREATEPASSWORD:%%D=-%%E!"

)
)
)

echo %CREATEPASSWORD% >> C:\Pswrd.Zask\Password.Zask
attrib C:\Pswrd.Zask\Password.Zask +s +h & echo. & echo Password Created!

echo %CREATEKEY% >> C:\Pswrd.Zask\Key.Zask
attrib C:\Pswrd.Zask\Key.Zask +s +h & echo Username Created!
echo.

if exist "%~dp0ResetPassword.bat" (
del "%~dp0ResetPassword.bat" )

:ResetPassword
set /p "RESETOPTION=Would you like to create the password options file in the current directory (Y/N)? : "
if /i %RESETOPTION%==Y goto ResetOptions
if /i %RESETOPTION%==N goto SkipResetOptions

:ResetOptions
echo @echo off >> PasswordOptions.bat
echo title ResetPassword.bat >> PasswordOptions.bat
echo color 0a >> PasswordOptions.bat
echo :start >> PasswordOptions.bat
echo. >> PasswordOptions.bat
echo echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป >> PasswordOptions.bat
echo echo บ This file is used to reset your password, hide it for future purposes or delete it บ >> PasswordOptions.bat 
echo echo บ      to avoid other users from removing your password. You have 5 options          บ >> PasswordOptions.bat
echo echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ >> PasswordOptions.bat
echo echo. >> PasswordOptions.bat
echo echo 1 - Reset password. >> PasswordOptions.bat
echo echo 2 - Open password folder. >> PasswordOptions.bat
echo echo 3 - Unhide files in the password folder. >> PasswordOptions.bat
echo echo 4 - Hide files in the password folder. >> PasswordOptions.bat
echo echo 5 - Exit dialog. >> PasswordOptions.bat
echo echo. >> PasswordOptions.bat
echo set /p "OPTIONS=Chose a number to select that option : " >> PasswordOptions.bat
echo if %%OPTIONS%%==1 goto PasswordReset >> PasswordOptions.bat
echo if %%OPTIONS%%==2 start C:\Pswrd.Zask ^& cls ^& goto start >> PasswordOptions.bat
echo if %%OPTIONS%%==3 attrib C:\Pswrd.Zask\Password.Zask -s -h ^& attrib C:\Pswrd.Zask\Key.Zask -s -h ^& cls ^& goto start >> PasswordOptions.bat
echo if %%OPTIONS%%==4 attrib C:\Pswrd.Zask\Password.Zask +s +h ^& attrib C:\Pswrd.Zask\Key.Zask +s +h ^& cls ^& goto start >> PasswordOptions.bat
echo if %%OPTIONS%%==5 exit >> PasswordOptions.bat
echo. >> PasswordOptions.bat
echo :PasswordReset >> PasswordOptions.bat
echo cls >> PasswordOptions.bat
echo set /p "RESET=Are you sure you want to reset your password (Y/N)? : " >> PasswordOptions.bat
echo if /i %%RESET%%==Y goto ResetPassword >> PasswordOptions.bat
echo if /i %%RESET%%==N goto start >> PasswordOptions.bat
echo cls >> PasswordOptions.bat
echo. >> PasswordOptions.bat
echo :ResetPassword >> PasswordOptions.bat
echo rd /s /q "C:\Pswrd.Zask" >> PasswordOptions.bat
echo echo Password was deleted! >> PasswordOptions.bat
echo pause >> PasswordOptions.bat
echo del %%~n0%%~x0 >> PasswordOptions.bat
echo exit >> PasswordOptions.bat
cls

echo. & echo Created file "%~dp0ResetPassword.bat" & timeout /t 5 /nobreak

:SkipResetOptions

start %~n0%~x0
exit

:PasswordScreen
color 0a
cls
echo Existing User Account.
echo.

setlocal EnableDelayedExpansion

set /p "PASSWORD= Enter Password : "
set /p "KEY= Enter the original encryption key : "

set CHAR=0123456789azbycxdwevfugthsirjqkplomn

for /l %%C in (10 1 36) do (

for /f %%D in ("!CHAR:~%%C,1!") do (

set /a MATH=%%C*%CHECKKEY%
for /f %%E in ("!MATH!") do (

set "CHECKPASSWORD=!CHECKPASSWORD:%%E=%%D!"

)
)
)

for /f %%F in ("!CHECKPASSWORD!") do (
set "CHECKPASSWORD=!CHECKPASSWORD:-=!"

)


if %PASSWORD%==%CHECKPASSWORD% (
goto Operation1True
) else (
goto OperationFalse
)

:Operation1True
if %KEY%==%CHECKKEY% (
goto Operation2True
) else (
goto OperationFalse
)

:OperationFalse
color 0c
echo Password Incorrect!
timeout /t 10 /nobreak
goto PasswordScreen

:Operation2True
cls
echo Password Correct!
echo.
pause