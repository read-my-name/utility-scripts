@echo off
echo Checking disk space...
for /f "tokens=3" %%a in ('dir C:\') do set freeC=%%a
for /f "tokens=3" %%a in ('dir D:\') do set freeD=%%a
echo Free space on C: %freeC%
echo Free space on D: %freeD%
pause
