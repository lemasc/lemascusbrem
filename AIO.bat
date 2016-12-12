@ECHO OFF
@cls
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%:%ldt:~12,6%
echo [%ldt%] Execute File> log.txt
echo [%ldt%] Start Restoring Process> log.txt
goto printtitle

:printtitle
@TITLE AIO USB Virus Remover V.1.1
@ECHO -------------------------------------------------------------------------
@ECHO All In 1 USB Virus Remover Version 1.1
@ECHO Kill *.lnk, autorun.inf, *.vbs, *.scr and more
@ECHO ------------------------------------------------------------------------
@ECHO Working...
ECHO Enter drive letter using the format "X:"
@SET /P DRIVELETTER= 
SET /a c=0
echo [%ldt%] Start Cleaning Shortcut..> log.txt
IF "%~d0"=="%DRIVELETTER%" goto cleanshortcut

:cleanshortcut
echo [%ldt%] Restoring Files..> log.txt
attrib -h -r -s /s /d %DRIVELETTER%\*.*
echo [%ldt%] Restoring Successful..> log.txt
echo [%ldt%] Deleting Shortcuts..> log.txt
del %DRIVELETTER%\*.lnk
del %DRIVELETTER%\*.scr
del %DRIVELETTER%\*\*.lnk
del %DRIVELETTER%\*\*.scr
echo [%ldt%] Moving Files..> log.txt
echo [%ldt%] DOS ERROR: Fail to access the folder name " ", No such of the directory.> log.txt
ECHO Restoring shortcut succesful
ECHO Your files are inside the unnamed folder(Sorry, i can't auto rename it)
pause
echo [%ldt%] Skip DOS ERROR, Continue restore> log.txt
goto cleanscr

:cleanscr
cd %SystemRoot%
echo [%ldt%] Cleaning SCR File..> log.txt
del WINLODR.SCR
ECHO Fix *.SCR Virus Succesful
echo [%ldt%] Cleaning SCR File Successful..> log.txt
pause
goto cleanautorun

:cleanautorun
echo [%ldt%] Cleaning Autorun..> log.txt
call cleanautorun.bat
echo .
goto cleanvbs

:cleanvbs
call cleanvbs.bat
goto complete

:complete
start explorer.exe
echo [%ldt%] Cleaning Complete!> log.txt
ECHO Cleaning complete!
pause
exit