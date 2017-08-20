@ECHO OFF
@cls
::Set date an time in the log fle
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%:%ldt:~12,6%
set /p ver=<VERSION
echo [%ldt%] Execute File> log/log.txt
echo [%ldt%] Start Restoring Process> log/log.txt
goto printtitle

:printtitle
@TITLE Lemasc USB Virus Remover %ver%
@ECHO -------------------------------------------------------------------------
@ECHO Lemasc USB Virus Remover Portable Version %ver%
@ECHO Kill *.lnk, autorun.inf, *.vbs, *.scr and more
@ECHO ------------------------------------------------------------------------
@ECHO Running with Normal Mode
@ECHO Working...
ECHO Enter drive letter using the format "X:"
@SET /P DRIVELETTER= 
SET /a c=0
echo [%ldt%] Start Cleaning Shortcut..> log/log.txt
IF "%~d0"=="%DRIVELETTER%" goto cleanshortcut

:cleanshortcut
echo [%ldt%] Restoring Files..> log/log.txt
attrib -h -r -s /s /d %DRIVELETTER%\*.*
echo [%ldt%] Restoring Successful..> log/log.txt
echo [%ldt%] Deleting Shortcuts..> log/log.txt
del %DRIVELETTER%\*.lnk
del %DRIVELETTER%\*.scr
del %DRIVELETTER%\*.inf
del %DRIVELETTER%\*.FAT32
echo [%ldt%] Moving Files..> log/log.txt
echo [%ldt%] DOS ERROR: Fail to access the folder name " ", No such of the directory.> log/log.txt
ECHO Restoring shortcut succesful
ECHO The System can't find the file expected.
ECHO  Fail to moved files, please manually moved it.
pause
echo [%ldt%] Skip DOS ERROR, Continue restore> log/log.txt
goto cleanautorun

:cleanautorun
echo [%ldt%] Cleaning Autorun..> log/log.txt
call %CD%\cleanautorun.bat
echo .
goto cleanvbs

:cleanvbs
call %CD%\cleanvbs.bat
goto complete

:complete
start explorer.exe
echo [%ldt%] Cleaning Complete!> log/log.txt
ECHO Command running successfully
pause
exit