@echo off


:start
cls
echo  by Aerro.Inc Under MIT Licence.
echo .
echo Choose an action below by entering its number.
echo .
echo [1] Setup SSID And password
echo [2] Activate Hotspot
echo [3] Deactivate Hotspot
echo [4] Exit Program
echo [5] Need help (hosted network error)
 set /p option=
if %option%==1 goto setup
if %option%==2 goto activate
if %option%==3 goto deactivate
if %option%==4 goto finish
if %option%==5 goto help
echo Select from given options only
pause
goto start

rem set all the requied fields by user

:setup

netsh wlan stop hostednetwork >NUL
echo Enter the SSID of the hotspot : (Name of Your)
set /p hotspot=
echo Enter the password for accessing the hotspot (8 characters minimum)
set /p password=
echo press Enter key to START Hotspot...
set /p Confirm=
netsh wlan set hostednetwork mode=allow ssid=%hotspot% key=%password%
netsh wlan start hostednetwork
netsh wlan show hostednetwork
pause
goto start

:activate
echo .
netsh wlan set hostednetwork mode=allow ssid=hotpot key=12345678
netsh wlan start hostednetwork
echo Hotspot[SSID] Name : hotpot
echo password : 12345678
pause
goto start

:deactivate
echo .
netsh wlan stop hostednetwork
pause
goto start

:finish
exit

:help
start "" https://aerro-a.blogspot.in
