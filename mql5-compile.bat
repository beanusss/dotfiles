@echo off

:: set it to your metaeditor.exe or metaeditor64.exe location
set METAEDITOR="C:\Program Files\MetaTrader 5\metaeditor64.exe"

:: set it to your experts advisors folder location
set EXPERT_ADVISORS_PATH="C:\Users\pietr\AppData\Roaming\MetaQuotes\Terminal\D0E8209F77C8CF37AD8BF550E51FF075\MQL5\Experts"

echo.
echo ========== COMPILATION STARTED ==========

:: executing the compilation command
%METAEDITOR% /compile:"%CD%" /include:"%CD%\inc" /include:"%METAEDITOR%\Include" /log:"log.txt"

:: displaying the log file content
type "log.txt"
echo.
echo.


:: moving .ex5 file to the ea directory if it exists
if exist *.ex5 (
    move "%CD%/*.ex5" %EXPERT_ADVISORS_PATH%
    echo !! The generated file has been automatically transferd in the selected expert advisors folder !!
) else (
    echo !! File generation failed due to an error !!
)

echo.
echo.
echo ========== COMPILATION TERMINATED ==========
echo.

