@echo off
title PC CLEANER
mode con: cols=50 lines=1
color 0

:: Kill explorer to unlock files
taskkill /f /im explorer.exe >nul 2>&1

:: User temp
del /f /s /q "%temp%\*.*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*.*" >nul 2>&1
del /f /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1
del /f /s /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\*.*" >nul 2>&1
del /f /s /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "C:\Users\%username%\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\*.*" >nul 2>&1
del /f /s /q "C:\Users\%username%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
del /f /s /q "C:\Windows\System32\LogFiles\*.*" >nul 2>&1
del /f /s /q "C:\Windows\Debug\*.*" >nul 2>&1
del /f /s /q "C:\Windows\Logs\*.*" >nul 2>&1

:: System cleanup
cleanmgr /sagerun:1 >nul 2>&1
ipconfig /flushdns >nul 2>&1
powercfg -h off >nul 2>&1

:: Clear recycle bin (force)
rd /s /q C:\$Recycle.bin >nul 2>&1

:: Empty directories (force remove if empty)
for /d %%x in ("C:\Windows\Temp\*") do rd "%%x" /s /q >nul 2>&1
for /d %%x in ("%temp%\*") do rd "%%x" /s /q >nul 2>&1

:: Restart explorer
start explorer.exe

:: Popup with sound
echo msgbox "PC CLEANED`n`nAll junk removed. Restart recommended.",64,"Done" > %temp%\done.vbs
%temp%\done.vbs
del %temp%\done.vbs >nul 2>&1

exit