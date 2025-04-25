@echo off
cls & color 0B
Mode con cols=90 lines=10

goto:main

:FullCopyrightInfo
ECHO this program is inteded to convert proprietary apple image formats to PNG files
ECHO quickly and using strictly free and open-source methods
ECHO Copyright (C) 2025 Andrew Castillo
pause
cls
ECHO This program is free software: you can redistribute it and/or modify
ECHO it under the terms of the GNU General Public License as published by
ECHO the Free Software Foundation, either version 3 of the License, or
ECHO (at your option) any later version.
pause
cls
ECHO This program is distributed in the hope that it will be useful,
ECHO but WITHOUT ANY WARRANTY; without even the implied warranty of
ECHO MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
ECHO GNU General Public License for more details.
pause
cls
ECHO You should have received a copy of the GNU General Public License
ECHO along with this program.  If not, see <https://www.gnu.org/licenses/>.
pause
cls
ECHO You can contact myself by leaving a message on the github repo for this
ECHO project found at https://github.com/AndrewCastillo05/HEIC-to-png-quick-converter
ECHO or via email at andrew.castillo05169@gmail.com
cls
goto:disp


:QuickCopyrightInfo
ECHO HEIC-to-png-quick-converter Copyright (C) 2025  Andrew Castillo
ECHO This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
ECHO This is free software, and you are welcome to redistribute it
ECHO under certain conditions; type `show c' for details.
goto:eof


:main
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
goto:disp

:disp
cls
ECHO ************************************************************************************
ECHO HEIC to PNG Quick Converter V 1.0
ECHO what would you like to do?
ECHO [1] - convert this directory
ECHO [2] - view copyright
ECHO [3] - exit program
ECHO: 
ECHO: 
ECHO ************************************************************************************
set /P userInput=""
IF %userInput% EQU 1 (
    goto:convertFiles
) ELSE IF %userInput% EQU 2 (
    goto:FullCopyrightInfo
) ELSE IF %userInput% EQU 3 (
    EXIT /B 0
) ELSE (
    Echo Please enter a valid number
    pause
    goto:disp
)

:convertFiles
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
goto:eof
