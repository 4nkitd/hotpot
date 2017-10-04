@echo off

REM MIT License
REM
REM Copyright (c) 2017 Aerro.Inc
REM
REM Permission is hereby granted, free of charge, to any person obtaining a copy
REM of this software and associated documentation files (the "Software"), to deal
REM in the Software without restriction, including without limitation the rights
REM to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
REM copies of the Software, and to permit persons to whom the Software is
REM furnished to do so, subject to the following conditions:
REM
REM The above copyright notice and this permission notice shall be included in all
REM copies or substantial portions of the Software.
REM
REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
REM IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
REM FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
REM AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
REM LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
REM SOFTWARE.


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

rem pre defined service no input required

:activate
echo .
netsh wlan set hostednetwork mode=allow ssid=hotpot key=12345678
netsh wlan start hostednetwork
echo Hotspot[SSID] Name : hotpot
echo password : 12345678
pause
goto start

rem stop all hotspot services

:deactivate
echo .
netsh wlan stop hostednetwork
pause
goto start

rem exit hte program

:finish
exit

rem need help from online sources

:help
start "" https://aerroweb.wordpress.com/hotpot/
exit
