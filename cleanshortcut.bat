@ECHO OFF
@cls
goto printtitle

:printtitle
@TITLE Lemasc USB Virus Remover V.1.2
@ECHO -------------------------------------------------------------------------
@ECHO Lemasc USB Virus Remover Portable Version 1.2
@ECHO Kill *.lnk, autorun.inf, *.vbs, *.scr and more
@ECHO ------------------------------------------------------------------------
@ECHO Special Command: -q -s (RemoveShortcut:QuickMode)
@ECHO Working...
ECHO Enter drive letter using the format "X:"
@SET /P DRIVELETTER= 
SET /a c=0
IF "%~d0"=="%DRIVELETTER%" goto cleanshortcut

:cleanshortcut
attrib -h -r -s /s /d %DRIVELETTER%\*.*
del %DRIVELETTER%\*.lnk
del %DRIVELETTER%\*.scr
del %DRIVELETTER%\*\*.lnk
del %DRIVELETTER%\*\*.scr
ECHO Restoring shortcut succesful
ECHO The System can't find the file expected.
ECHO  Fail to moved files, please manually moved it.
pause
goto complete

:complete
ECHO Command running successfully
pause
exit