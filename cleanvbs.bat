@echo off
@TITLE VBS Remove
Echo Deleting VBS Script.....
taskkill /f /im explorer.exe
taskkill /f /im wsscript.exe
ver | findstr /l "5.1" > nul
if %ERRORLEVEL% == 0 (goto XP) else (goto V78)

:XP
%HOMEPATH%\Start Menu\Programs\Startup
attrib -h -r -s /s /d *.*
del *.vbs
del *.ovbss
del *.vbs_1
del *.vbs.out
del *.vbss
%TEMP%
del autorun.exe
del *.vbs  
pause

:V78
%APPDATA%\Roaming\Microsoft\Start Menu\Programs\Startup\
del *.vbs
del *.ovbss
del *.vbs_1
del *.vbs.out
del *.vbss
%TEMP%
del autorun.exe
del *.vbs
pause