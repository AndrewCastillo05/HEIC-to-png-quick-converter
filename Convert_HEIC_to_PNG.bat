@echo off
cls & color 0B
Mode con cols=90 lines=10
set Location=%LOCALAPPDATA%\"Microsoft\WindowsApps"
set FileName=magick.exe

REM check if ImageMagick is installed and install it if needed.
REM *************************************************************************************
echo( & cls
echo(  & echo  Please Wait for moment .... Searching for "%FileName%" on "%Location%"
TimeOut /T 3 /NoBreak>Nul
cls
IF EXIST "%Location%\%FileName%" ( color 0A && echo ImageMagick is installed
) ELSE (
    Color 0C & echo ImageMagick is not installed & pause
    cls
    Color 0B & echo Installing ImageMagick
    winget install ImageMagick.Q16-HDRI
    color 0B & echo ImageMagick Installed
    pause
)

REM Convert the files
REM *************************************************************************************
echo Converting files in current directory
IF EXIST *.heic (
    magick mogrify -monitor -format jpg *.heic
    echo Files converted successfully
    pause
) ELSE IF EXIST *.heif (
    magick mogrify -monitor -format jpg *.heif
    echo Files converted successfully
    pause

) ELSE IF EXIST *.heifs (
    magick mogrify -monitor -format jpg *.heifs
    echo Files converted successfully
    pause

) ELSE IF EXIST *.avci (
    magick mogrify -monitor -format jpg *.avci
    echo Files converted successfully
    pause

) ELSE IF EXIST *.avcs (
    magick mogrify -monitor -format jpg *.avcs
    echo Files converted successfully
    pause

) ELSE IF EXIST *.HIF (
    magick mogrify -monitor -format jpg *.HIF
    echo Files converted successfully
    pause
)