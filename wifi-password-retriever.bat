@echo off
for /F "skip=9 tokens=1,2 delims=:" %%i in ('netsh wlan show profiles') do (
   echo %%i | findstr /C:"    All User Profile" > nul
   if not errorlevel 1 (
       set profileName=%%j
       call :getPwd
   )
)
exit /b

:getPwd
for /F "skip=9 tokens=2 delims=:" %%a in ('netsh wlan show profiles %profileName:~1% key=clear ^| findstr /C:"Key Content"') do (
    echo Wi-Fi: %profileName:~1% - Password:%%a
)

pause
