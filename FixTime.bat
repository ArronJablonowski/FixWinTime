@echo off
REM set/fix Windows time - dual booting Win/Linux messes with Window's current time. 
REM This script will set the time to the timezones below. UnComment/Comment the needed Timezone.  

REM get Admin to stop/start services
 
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
IF '%PROCESSOR_ARCHITECTURE%' EQU 'amd64' (
   >nul 2>&1 "%SYSTEMROOT%\SysWOW64\icacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
 ) ELSE (
   >nul 2>&1 "%SYSTEMROOT%\system32\icacls.exe" "%SYSTEMROOT%\system32\config\system"
)
 
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
 
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
 
    "%temp%\getadmin.vbs"
     del "%temp%\getadmin.vbs"
     exit /B
 
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

REM wait for service to start and to get an Internet connection  
REM timeout /t 10

REM set timezone to US central standard time 
REM tzutil /s "Eastern Standard Time"
REM tzutil /s "Central Standard Time"
tzutil /s "Mountain Standard Time"
REM *Arizona w/o DST = tzutil /s "US Mountain Standard Time"
REM tzutil /s "US Mountain Standard Time"
REM tzutil /s "Pacific Standard Time"
REM tzutil /s "Alaskan Standard Time"
REM tzutil /s "Hawaiian Standard Time"

REM stop w32time service 
REM net stop w32time

REM wait for service to stop 
REM timeout /t 5

REM start time service 
net start w32time

REM wait for service to start 
timeout /t 5

REM (re)sync time 
w32tm /resync