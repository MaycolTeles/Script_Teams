@ECHO off


SET chrome="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
SET link="https://github.com/MaycolTeles/Script_Teams/archive/refs/heads/master.zip"
SET downloaded_file="C:\Users\%USERNAME%\Downloads\Script_Teams-master.zip"
SET extracted_file="C:\Users\%USERNAME%\Desktop\Script_Teams-master"
SET desktop="C:\Users\%USERNAME%\Desktop\\"


ECHO.
ECHO.
ECHO.
ECHO.
ECHO 				This script is provided by Maycol Teles. Please enjoy!
ECHO.
ECHO.

TIMEOUT 2 >nul

GOTO check_extracted_file



:check_extracted_file
ECHO.
ECHO.
ECHO Checking if file already exists...
ECHO.
ECHO.

TIMEOUT 2 >nul

IF EXIST %extracted_file% (ECHO File already exists! & GOTO run_script) ELSE (ECHO File not found & GOTO check_downloaded_file)





:run_script
ECHO.
ECHO.
ECHO Opening Config File to Set Up the Main Configurations...
ECHO.
ECHO.

TIMEOUT 3 >nul

START chrome --restore-last-session

START "C:\Users\%USERNAME%\Desktop\Script_Teams-master\config.json"

EXIT




:check_downloaded_file
ECHO.
ECHO.
ECHO Checking if file is already downloaded...
ECHO.
ECHO.

TIMEOUT 2 >nul

IF EXIST %downloaded_file% (ECHO File already downloaded! & GOTO extract_file) ELSE (ECHO File not downloaded yet & GOTO download_file)




:extract_file
ECHO.
ECHO.
ECHO Extrating file...
ECHO.
ECHO.

TIMEOUT 2 >nul

POWERSHELL -command "Expand-Archive -Force '%downloaded_file%' '%desktop%'"

GOTO wait_extract



:wait_extract
ECHO.
ECHO.
ECHO Waiting for file to be extracted...
ECHO.
ECHO.

TIMEOUT 2 >nul

IF EXIST %extracted_file% (ECHO File extracted! & GOTO check_extracted_file) ELSE (GOTO wait_extract)




:download_file
ECHO.
ECHO.
ECHO Downloading Python Script...
ECHO.
ECHO.

TIMEOUT 2 >nul

START chrome %link%

GOTO wait_download







:wait_download
ECHO.
ECHO.
ECHO Waiting for file to be downloaded...
ECHO.
ECHO.

TIMEOUT 2 >nul

IF EXIST %downloaded_file% (taskkill /F /IM chrome.exe /T & ECHO. & ECHO. & ECHO File downloaded! & GOTO check_downloaded_file) ELSE (GOTO wait_download)


