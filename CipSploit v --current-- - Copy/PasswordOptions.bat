@echo off 
title ResetPassword.bat 
color 0a 
:start 
 
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป 
echo บ This file is used to reset your password, hide it for future purposes or delete it บ  
echo บ      to avoid other users from removing your password. You have 5 options          บ 
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ 
echo. 
echo 1 - Reset password. 
echo 2 - Open password folder. 
echo 3 - Unhide files in the password folder. 
echo 4 - Hide files in the password folder. 
echo 5 - Exit dialog. 
echo. 
set /p "OPTIONS=Chose a number to select that option : " 
if %OPTIONS%==1 goto PasswordReset 
if %OPTIONS%==2 start C:\Pswrd.Zask & cls & goto start 
if %OPTIONS%==3 attrib C:\Pswrd.Zask\Password.Zask -s -h & attrib C:\Pswrd.Zask\Key.Zask -s -h & cls & goto start 
if %OPTIONS%==4 attrib C:\Pswrd.Zask\Password.Zask +s +h & attrib C:\Pswrd.Zask\Key.Zask +s +h & cls & goto start 
if %OPTIONS%==5 exit 
 
:PasswordReset 
cls 
set /p "RESET=Are you sure you want to reset your password (Y/N)? : " 
if /i %RESET%==Y goto ResetPassword 
if /i %RESET%==N goto start 
cls 
 
:ResetPassword 
rd /s /q "C:\Pswrd.Zask" 
echo Password was deleted 
pause 
del %~n0%~x0 
exit 
