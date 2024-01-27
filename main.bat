@echo off
setlocal enabledelayedexpansion

set ver=1.0
set name=reactexa
set ownerid=1RDUHDudxJ

set "init_url=https://keyauth.win/api/1.2/?type=init&ver=%ver%&name=%name%&ownerid=%ownerid%"

echo.
echo.
echo Connecting...
for /f "delims=" %%A in ('curl -s -X POST "%init_url%"') do set "init_response=%%A"

for /f "tokens=1,* delims=:" %%A in ('echo !init_response! ^| jq ".success, .sessionid"') do (
    set "key=%%~A"
    if /i "!key!"=="true" (
        set "success=!key!"
    ) else if /i "!key!"=="false" (
        set "success=!key!"
    ) else (
        set "sessionid=!key!"
    )
)

for /f "tokens=2 delims= " %%a in ('whoami /user ^| find "S-1-5"') do (
    set "hwid=%%a"
)

echo.
echo.

if /i "%success%"=="true" (
    echo Initialization successful.
    echo Session ID: %sessionid%
    ping 1.1.1.1 -n 3 -w 3000 > nul
) else (
    echo Initialization failed.
    goto :eof
)

:displayMenu

cls
echo.
echo.
echo  [1] Login
echo  [2] Register
echo  [3] Upgrade
echo  [4] License key only
echo.
echo.
set /p "option=Choose option: "

if "%option%"=="1" (
    set "api_type=login"
) else if "%option%"=="2" (
    set "api_type=register"
) else if "%option%"=="3" (
    set "api_type=upgrade"
) else if "%option%"=="4" (
    set "api_type=license"
) else (
    echo  Invalid option. Please choose a valid option.
    goto displayMenu
)

echo.

if "%api_type%"=="login" (
    set /p "username=Enter your username: "
    set /p "password=Enter your password: "
    set "api_url=https://keyauth.win/api/1.2/?type=%api_type%&username=!username!&pass=!password!&sessionid=!sessionid!&name=%name%&ownerid=%ownerid%&hwid=!hwid!"
) else if "%api_type%"=="register" (
    set /p "username=Enter your username: "
    set /p "password=Enter your password: "
    set /p "key=Enter your license: "
    set "api_url=https://keyauth.win/api/1.2/?type=%api_type%&username=!username!&pass=!password!&key=!key!&sessionid=!sessionid!&name=%name%&ownerid=%ownerid%&hwid=!hwid!"
) else if "%api_type%"=="upgrade" (
    set /p "username=Enter your username: "
    set /p "key=Enter your key: "
    set "api_url=https://keyauth.win/api/1.2/?type=%api_type%&username=!username!&key=!key!&sessionid=!sessionid!&name=%name%&ownerid=%ownerid%"
) else if "%api_type%"=="license" (
    set /p "license_key=Enter your License Key: "
    set "api_url=https://keyauth.win/api/1.2/?type=%api_type%&key=!license_key!&sessionid=!sessionid!&name=%name%&ownerid=%ownerid%&hwid=!hwid!"
)

for /f "delims=" %%B in ('curl -s -X POST "!api_url!" ^| jq ".success, .message"') do set "api_response=%%B"

echo.
echo API Response: %api_response%

endlocal
exit /b 0
