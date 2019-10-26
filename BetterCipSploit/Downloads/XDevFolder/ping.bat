tracert -d -h 1 www.google.com
if %ERRORLEVEL%==0 (
cls
echo success >>s.dll
pause
exit
) Else (
cls
echo failure >>f.dll
pause
exit)